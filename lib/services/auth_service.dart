import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:webhook_deploy_panel/models/token.dart';
import 'package:webhook_deploy_panel/services/base_service.dart';

import '../models/token.dart';

class AuthService extends BaseService {
  Future<dynamic> login(Object form) async {
    try {
      return await this.post(
        endpoint: 'login',
        data: form,
        auth: false,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveToken(Token token) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('@token', jsonEncode(token.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  static Future<Token> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final tokenString = prefs.getString('@token');

      Token token = Token.fromJson(jsonDecode(tokenString));

      return token;
    } catch (e) {
      rethrow;
    }
  }
}
