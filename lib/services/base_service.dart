import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/models/token.dart';
import 'package:webhook_deploy_panel/services/auth_service.dart';

abstract class BaseService {
  String baseEndpoint;

  BaseOptions _baseOptions;
  Dio _dio;

  BaseService({
    this.baseEndpoint,
  }) {
    this._makeOption();
    this._makeDio();
  }

  void _makeOption() {
    this._baseOptions = new BaseOptions(
      baseUrl: 'http://webhook-deploy/api/v1/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
  }

  void _makeDio() {
    this._dio = new Dio(this._baseOptions);
  }

  Future<dynamic> get({
    String endpoint,
    bool auth = true,
  }) async {
    try {
      Token token = await AuthService.getToken();

      this._baseOptions.headers = {
        "Authorization": "Bearer ${token.accessToken}"
      };

      final response = await this._dio.get(
            this._getEndpoint(endpoint),
          );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post({
    String endpoint,
    Object data,
    bool auth = true,
  }) async {
    try {
      Response response = await this._dio.post(
            this._getEndpoint(endpoint),
            data: data,
          );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  String _getEndpoint(String endpointOnMethod) {
    if (endpointOnMethod == null) {
      return this.baseEndpoint;
    }

    return endpointOnMethod;
  }
}
