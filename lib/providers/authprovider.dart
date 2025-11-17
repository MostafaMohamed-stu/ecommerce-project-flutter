import 'package:flutter/material.dart';
import 'package:flutter_application_20/models/authmodel.dart';
import 'package:flutter_application_20/services/authservice.dart';

class AuthProvider extends ChangeNotifier {
  AuthModel? authModel;
  Future<void> login({required String email, required String password}) async {
    authModel = await AuthService.login(email, password);
    notifyListeners();
  }

  Future<void> sigup({
    required String name,
    required String contact,
    required String email,
    required String password,
  }) async {
    authModel = await AuthService.signup(name, contact, email, password);
    notifyListeners();
  }
}
