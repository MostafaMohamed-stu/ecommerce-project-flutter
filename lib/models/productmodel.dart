class Product {
  final int id;

  final String name;
  final String description;
  final double price;
  final int stockQuantity;
  final String imagePath;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stockQuantity,
    required this.imagePath,
  });
}

class ProductModel {
  final List<Product> product;

  ProductModel({required this.product});

  factory ProductModel.fromJson(List json) {
    List<Product> temp = json.map<Product>((list) {
      return Product(
        id: list['id'],
        name: list['name'],
        description: list['description'],
        price: list['price'],
        stockQuantity: list['stockQuantity'],
        imagePath: list['imagePath'],
      );
    }).toList();

    return ProductModel(product: temp);
  }
}
