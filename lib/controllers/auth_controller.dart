import 'package:webhook_deploy_panel/models/token.dart';
import 'package:webhook_deploy_panel/services/auth_service.dart';

class AuthController {
  AuthService _authService;

  AuthController() {
    this._authService = new AuthService();
  }

  Future<Token> doLogin(Object form) async {
    try {
      final response = await this._authService.login(form);

      final token = Token.fromJson(response);

      await this._authService.saveToken(token);

      return token;
    } catch (e) {
      print('doLogin - error');
      rethrow;
    }
  }
}
