import 'package:flutter/material.dart';
import 'package:flutter_application_20/models/productmodel.dart';
import 'package:flutter_application_20/providers/cartprovider.dart';
import 'package:flutter_application_20/providers/productprovider.dart';
import 'package:provider/provider.dart';

class CardProductWidget extends StatelessWidget {
  final Product model;
  final int userId;
  const CardProductWidget({
    super.key,
    required this.model,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.shopping_bag_outlined, color: Colors.teal),
            model.imagePath,
          ),
          Text(model.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(2),
                topLeft: Radius.circular(2),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "\$${model.price.toStringAsFixed(0)}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Consumer<CartProvider>(
                  builder:
                      (
                        BuildContext context,
                        CartProvider value,
                        Widget? child,
                      ) {
                        final cartList = value.cartModel?.cartItems;

                        bool isInCart =
                            cartList?.any(
                              (element) => element.id == model.id,
                            ) ??
                            false;
                        return ElevatedButton(
                          onPressed: () {
                            if (isInCart) {
                              value.removeProductFromCart(
                                userId: userId,
                                productId: model.id,
                              );
                            } else {
                              value.addProductToCart(
                                userId: userId,
                                productId: model.id,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isInCart
                                ? Colors.redAccent
                                : Colors.teal,
                            foregroundColor: Colors.white,
                          ),
                          child: Text(isInCart ? "Added ✓" : "Add to Cart"),
                        );
                      },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
