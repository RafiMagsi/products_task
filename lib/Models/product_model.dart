import 'dart:convert';

List<ProductModel> productsFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));
String productsToJson(List<ProductModel> products) => json.encode(List<dynamic>.from(products.map((x) => x.toJson())));

class ProductModel {
  String? name;
  String? description;
  int? price;

  ProductModel({this.name = "", this.description = "", this.price = 0});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        price: json["price"] ?? 0,
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
      };
}
