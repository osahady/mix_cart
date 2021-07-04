import 'package:json_annotation/json_annotation.dart';
part 'image.g.dart';

@JsonSerializable(createToJson: false)
class Image {
  final int id;
  final String image;

  Image({
    required this.id,
    required this.image,
  });

  factory Image.fromJson(Map<String, dynamic> map) => _$ImageFromJson(map);
}
