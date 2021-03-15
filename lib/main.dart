import 'package:flutter/material.dart';
import 'package:webhook_deploy_panel/screens/home/home_screen.dart';
import 'package:webhook_deploy_panel/screens/sing_in/sing_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webhook Deploy Panel',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.grey,
        accentColor: Colors.cyanAccent,
        backgroundColor: Colors.grey[800],
        dialogBackgroundColor: Colors.grey[800],
        scaffoldBackgroundColor: Colors.grey[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SingInScreen(),
    );
  }
}
