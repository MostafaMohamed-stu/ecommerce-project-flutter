import 'package:flutter/cupertino.dart';
import 'package:flutter_application_20/models/cartmodel.dart';
import 'package:flutter_application_20/services/cartservice.dart';

class CartProvider extends ChangeNotifier {
  CartModel? cartModel;
  String? message;

  Future<void> getCartById({required int userId}) async {
    cartModel = await CartService.getCartById(userId: userId);
    notifyListeners();
  }

  Future<void> addProductToCart({
    required int userId,
    required int productId,
  }) async {
    message = await CartService.addProductToCart(
      userId: userId,
      productId: productId,
    );
    await getCartById(userId: userId);
    notifyListeners();
  }

  Future<void> removeProductFromCart({
    required int userId,
    required int productId,
  }) async {
    message = await CartService.removeProductFromCart(
      userId: userId,
      productId: productId,
    );
    await getCartById(userId: userId);
    notifyListeners();
  }
}
