import 'package:webhook_deploy_panel/models/token.dart';
import 'package:webhook_deploy_panel/services/auth_service.dart';

class AuthController {
  AuthService _authService;

  AuthController() {
    this._authService = new AuthService();
  }

  Future<Token> doLogin(Object form) async {
    try {

      await this._authService.login(form);


    } catch (e) {
      rethrow;
    }
  }
}
