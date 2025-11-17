import 'package:flutter/material.dart';
import 'package:flutter_application_20/providers/authprovider.dart';
import 'package:flutter_application_20/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      home: LoginPage(),
      ),
    );
  }
}