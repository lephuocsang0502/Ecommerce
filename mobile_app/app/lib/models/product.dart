import 'package:app/global.dart';

class Product {
  final String id;
  final double price, offer, quantity;
  final String name, description, material, slug;
  String productPictures;

  Product({
    this.id,
    this.price,
    this.offer,
    this.quantity,
    this.name,
    this.description,
    this.material,
    this.slug,
    this.productPictures,
    //this.colors,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      //colors: json['colors']['colors'],
      description: json['description'],
      id: json['_id'],
      slug: json['slug'],
      productPictures: "http://192.168.1.223:2000/public/" +
          json['productPictures'][0]['img'],
      material: json['material'],
      name: json['name'],
      price: json['price'].toDouble(),
      quantity: json['quantity'].toDouble(),
      offer: json['offer'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'offer': offer,
        'name': name,
        'description': description,
        'material': material,
        'productPictures': productPictures,
        //'colors': colors,
      };
}
