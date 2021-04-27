import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/providers/super_provider.dart';
import 'package:webhook_deploy_panel/screens/project/project_screen.dart';
import 'package:webhook_deploy_panel/screens/repository/repository_screen.dart';
import 'package:webhook_deploy_panel/screens/sing_in/sing_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SuperProvider(
      subTitleColor: Colors.orangeAccent,
      child: MaterialApp(
        title: 'Webhook Deploy Panel',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryColor: Colors.grey,
          accentColor: Colors.cyanAccent,
          backgroundColor: Colors.grey[800],
          dialogBackgroundColor: Colors.grey[800],
          scaffoldBackgroundColor: Colors.grey[800],
          errorColor: Colors.redAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: SingInScreen.ROUTE,
        routes: {
          SingInScreen.ROUTE: (context) => SingInScreen(),
          ProjectScreen.ROUTE: (context) => ProjectScreen(),
          RepositoryScreen.ROUTE: (context) => RepositoryScreen(),
        },
      ),
    );
  }
}
