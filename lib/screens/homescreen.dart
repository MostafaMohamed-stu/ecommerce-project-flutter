import 'package:flutter/material.dart';
import 'package:flutter_application_20/providers/productprovider.dart';
import 'package:flutter_application_20/screens/cartpage.dart';
import 'package:flutter_application_20/widgets/cardproductwidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final int userId;

  const HomeScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text("Shoppify", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          var products = value.productModel?.product;
          if (products == null) {
            value.getData();
            return Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return CardProductWidget(
                  model: products[index],
                  userId: userId,
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
         {
          Navigator.push(context , MaterialPageRoute(builder: (context) => CartPage()));
         },
        child: Icon(Icons.shopping_cart, color: Colors.teal),
      ),
    );
  }
}
