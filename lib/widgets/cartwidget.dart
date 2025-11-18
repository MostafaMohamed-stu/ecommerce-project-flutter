import 'package:flutter/material.dart';
import 'package:flutter_application_20/models/cartmodel.dart';
import 'package:flutter_application_20/providers/cartprovider.dart';

import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  CartItemModel item;
  int userId;
  CartItem({required this.item, required this.userId, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(
          item.image,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.shopping_bag_outlined, color: Colors.teal),
        ),
        title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Price: \$${item.price}"),

        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            context.read<CartProvider>().removeProductFromCart(
              userId: userId,
              productId: item.id,
            );
          },
        ),
      ),
    );
  }
}
