import 'dart:convert';

ProductDetails productDetailsFromJson(String str) =>
    ProductDetails.fromJson(json.decode(str));

String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

class ProductDetails {
  String id;
  String name;
  String description;
  String price;
  String brandId;
  String imageUrl;
  DateTime created;
  DateTime modified;

  ProductDetails({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.brandId,
    required this.imageUrl,
    required this.created,
    required this.modified,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        brandId: json["brandId"],
        imageUrl: json["imageUrl"],
        created: DateTime.parse(json["created"]),
        modified: DateTime.parse(json["modified"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "brandId": brandId,
        "imageUrl": imageUrl,
        "created": created.toIso8601String(),
        "modified": modified.toIso8601String(),
      };
}
