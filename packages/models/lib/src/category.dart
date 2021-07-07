import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  final int id;
  final String name;
  final String? description;
  final String image;

  Category({
    required this.id,
    required this.name,
    this.description,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> map) =>
      _$CategoryFromJson(map);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
