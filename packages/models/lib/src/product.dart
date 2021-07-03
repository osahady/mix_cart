import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String name;
  final double price;
  final String summary;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.summary,
  });

  factory Product.fromJson(Map<String, dynamic> map) => _$ProductFromJson(map);
}
