import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class BaseService {
  final String baseEndpoint;

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

  void post({
    String endpoint,
    Object data,
    bool auth = true,
  }) async {
    try {
      this._getEndpoint(endpoint);
      return;
      this._dio.post(
        this._getEndpoint(endpoint)
      );

    } catch (e) {
      rethrow;
    }
  }

  String _getEndpoint(String endpointOnMethod) {

    print(this.baseEndpoint == null);

  }

}
