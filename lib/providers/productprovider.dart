import 'package:flutter/material.dart';
import 'package:flutter_application_20/models/productmodel.dart';
import 'package:flutter_application_20/services/productservice.dart';

class ProductProvider extends ChangeNotifier {
  ProductModel? productModel;
  Future<void> getData() async {
    productModel = await ProductService.getData();
    notifyListeners();
  }
}
