import 'dart:convert';

import 'package:dio/dio.dart';

class UserController {
  void test(Object form) async {
    try {
      BaseOptions options = new BaseOptions(
        baseUrl: 'http://webhook-deploy/api/v1/',
        connectTimeout: 5000,
        receiveTimeout: 3000,
        /*headers: {
            "Authorization":
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC93ZWJob29rLWRlcGxveVwvYXBpXC92MVwvbG9naW4iLCJpYXQiOjE2MTU5MjU3OTcsImV4cCI6MTYxNTkyOTM5NywibmJmIjoxNjE1OTI1Nzk3LCJqdGkiOiJxdk5QbkRIM2F4ZVZoNWZtIiwic3ViIjoxLCJwcnYiOiJhOTU5Njc4ZWI3M2Q3Njg2MGFlZWFmOTg5ZDU1NjFlMDczZTFlNzhlIiwibmFtZSI6IkFkbWluIiwiZW1haWwiOiJhZG1pbkBhcHAuY29tIn0.LhskJba1M57x5GF-1ar5tFL3kUouujqoxhaYgs8POG8"
          }*/
      );

      Dio dio = new Dio(options);
      Response response = await dio.post(
        'login',
        data: form,
      );

      print(response.data['access_token']);
    } catch (e) {
      DioError error = e;

      print(error.response.statusCode);
      print(error.response.data['error']['message']);
      print(error.response.data['error']['requirements']);
    }
  }
}
