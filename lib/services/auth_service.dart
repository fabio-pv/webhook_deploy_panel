import 'package:webhook_deploy_panel/services/base_service.dart';

class AuthService extends BaseService {
  void login(Object form) async {
    try {

      this.post();


    } catch (e) {
      rethrow;
    }
  }
}
