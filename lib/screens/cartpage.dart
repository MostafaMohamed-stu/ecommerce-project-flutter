import 'package:flutter/material.dart';
import 'package:flutter_application_20/models/cartmodel.dart';
import 'package:flutter_application_20/providers/authprovider.dart';
import 'package:flutter_application_20/providers/cartprovider.dart';
import 'package:flutter_application_20/widgets/cartwidget.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int userId = context.watch<AuthProvider>().authModel!.id;

      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),

          centerTitle: true,
          title: Text(
            "Your Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          backgroundColor: Colors.teal,
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer<CartProvider>(
                builder: (context, value, child) {
                  final cartList = value.cartModel?.cartItems;

                  if (cartList == null) {
                    value.getCartById(userId: userId);
                    return Center(child: CircularProgressIndicator());
                  } else if (cartList.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 90,
                            color: Colors.teal,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Your cart is empty",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (context, index) {
                        CartItemModel item = cartList[index];
                        return CartItem(item: item, userId: userId);
                      },
                    );
                  }
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(color: Colors.teal),
              child: Center(
                child: Consumer<CartProvider>(
                  builder: (context, value, child) {
                    final total = value.cartModel?.totalPrice;
                    return Text(
                      "Total: \$$total",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      );
    }
  }

