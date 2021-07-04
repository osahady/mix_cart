import 'package:json_annotation/json_annotation.dart';
import 'package:models/models.dart';
part 'category.g.dart';

@JsonSerializable(createToJson: false)
class Category {
  final int id;
  final String name;
  final String description;
  final Image image;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> map) =>
      _$CategoryFromJson(map);
}
