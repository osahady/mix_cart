import 'package:json_annotation/json_annotation.dart';
import 'package:models/models.dart';
part 'product.g.dart';

@JsonSerializable(createToJson: false)
class Product {
  final int id;
  final String name;
  final double price;
  final String summary;
  final String link;
  final List<Image> images;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.summary,
    required this.link,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> map) => _$ProductFromJson(map);
}
