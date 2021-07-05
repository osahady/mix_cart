import 'package:json_annotation/json_annotation.dart';
part 'image.g.dart';

@JsonSerializable()
class AppImage {
  final int id;
  final String image;

  AppImage({
    required this.id,
    required this.image,
  });

  factory AppImage.fromJson(Map<String, dynamic> map) =>
      _$AppImageFromJson(map);

  Map<String, dynamic> toJson() => _$AppImageToJson(this);
}
