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

  String _getEndpoint({
    String endpointOnMethod,
    String urlParam,
  }) {
    if (urlParam != null) {
      urlParam = '/' + urlParam;
    }

    if (urlParam == null) {
      urlParam = '';
    }

    if (endpointOnMethod == null) {
      return this.baseEndpoint + urlParam;
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
            this._getEndpoint(
              endpointOnMethod: endpoint,
            ),
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
            this._getEndpoint(
              endpointOnMethod: endpoint,
            ),
            data: data,
          );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch({
    String endpoint,
    String urlParam,
    Object data,
    bool auth = true,
  }) async {
    try {
      await this._setToken(
        auth: auth,
      );

      Response response = await this._dio.patch(
        this._getEndpoint(
          endpointOnMethod: endpoint,
          urlParam: urlParam,
        ),
        data: data,
      );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete({
    String endpoint,
    String urlParam,
    Object data,
    bool auth = true,
  }) async {
    try {
      Response response = await this._dio.delete(
            this._getEndpoint(
              endpointOnMethod: endpoint,
              urlParam: urlParam,
            ),
          );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
