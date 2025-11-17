import 'package:dio/dio.dart';
import 'package:flutter_application_20/models/authmodel.dart';

class AuthService {
  static Dio dio = Dio();

  static Future<AuthModel> login(String email, String password) async {
    try {
      Response response = await dio.post(
        "https://ecommerceflutter2.runasp.net/api/Customer/login",
        data: {"email": email, "password": password},
      );
      return AuthModel.fromJson(response.data);
    } on DioException catch (dioerror) {
      throw Exception(dioerror.message);
    } catch (othererror) {
      throw (othererror);
    }
  }

  static Future<AuthModel> signup(
    String name,
    String contact,
    String email,
    String password,
  ) async {
    try {
      Response response = await dio.post(
        "https://ecommerceflutter2.runasp.net/api/Customer/signup",
        data: {
          "name": name,
          "contact": contact,
          "email": email,
          "password": password,
        },
      );
      return AuthModel.fromJson(response.data);
    } on DioException catch (dioerror) {
          throw Exception(dioerror.message);
    } catch (othererror) {
      throw (othererror);
    }
  }
}
