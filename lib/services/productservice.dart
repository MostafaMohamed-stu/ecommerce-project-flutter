import 'package:dio/dio.dart';
import 'package:flutter_application_20/models/productmodel.dart';

class ProductService {
  static Dio dio = Dio();

  static Future<ProductModel> getData() async {
    try {
      Response response = await dio.get(
        'https://ecommerceflutter2.runasp.net/api/Product/all',
      );

      return ProductModel.fromJson(response.data);
    } on DioException catch (dioerror) {
      throw Exception(dioerror.message);
    } catch (othererrors) {
      throw (othererrors);
    }
  }
}
