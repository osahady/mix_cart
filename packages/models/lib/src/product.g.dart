// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int,
    name: json['name'] as String,
    price: (json['price'] as num).toDouble(),
    summary: json['summary'] as String,
    link: json['link'] as String,
    images: (json['images'] as List<dynamic>)
        .map((e) => Image.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
