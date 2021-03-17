import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/services/base_service.dart';

class UserService extends BaseService {
  final String endpoint;

  UserService({
    @required this.endpoint,
  });
}
