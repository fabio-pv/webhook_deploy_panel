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

  String _getEndpoint(String endpointOnMethod) {
    if (endpointOnMethod == null) {
      return this.baseEndpoint;
    }

    return endpointOnMethod;
  }

  void _setToken({
    bool auth = true,
  }) async {
    if (!auth) {
      return;
    }

    Token token = await AuthService.getToken();

    this._baseOptions.headers = {
      "Authorization": "Bearer ${token.accessToken}"
    };
  }

  Future<dynamic> get({
    String endpoint,
    bool auth = true,
  }) async {
    try {
      await this._setToken(
        auth: auth,
      );

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
      await this._setToken(
        auth: auth,
      );

      Response response = await this._dio.post(
            this._getEndpoint(endpoint),
            data: data,
          );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete({
    String endpoint,
    bool auth = true,
    String uuid,
  }) async {
    try {
      await this._setToken(
        auth: auth,
      );

      endpoint = this._getEndpoint(endpoint);

      if (uuid != null) {
        endpoint += '/' + uuid;
      }

      final response = await this._dio.delete(
            endpoint,
          );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
