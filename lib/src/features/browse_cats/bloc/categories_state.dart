part of 'categories_bloc.dart';

enum BrowseCategoriesStatus { initial, success, failure }

class CategoriesState extends Equatable {
  final BrowseCategoriesStatus status;
  final List<Category> categories;
  final bool hasReachedMax;

  const CategoriesState({
    this.status = BrowseCategoriesStatus.initial,
    this.categories = const <Category>[],
    this.hasReachedMax = false,
  });

  CategoriesState copyWith({
    BrowseCategoriesStatus? status,
    List<Category>? categories,
    bool? hasReachedMax,
  }) {
    return CategoriesState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''CategoryState { status: $status, hasReachedMax: $hasReachedMax, categories: ${categories.length} }''';
  }

  @override
  List<Object> get props => [status, categories, hasReachedMax];

  factory CategoriesState.fromMap(Map<String, dynamic> map) =>
      _$CategoriesStateFromJson(map);

  Map<String, dynamic> toMap() => _$CategoriesStateToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesState _$CategoriesStateFromJson(Map<String, dynamic> json) {
  return CategoriesState(
    status: _$enumDecode(_$BrowseCategoriesStatusEnumMap, json['status']),
    categories: (json['categories'] as List<dynamic>)
        .map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList(),
    hasReachedMax: json['hasReachedMax'] as bool,
  );
}

Map<String, dynamic> _$CategoriesStateToJson(CategoriesState instance) =>
    <String, dynamic>{
      'status': _$BrowseCategoriesStatusEnumMap[instance.status],
      'categories': instance.categories,
      'hasReachedMax': instance.hasReachedMax,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$BrowseCategoriesStatusEnumMap = {
  BrowseCategoriesStatus.initial: 'initial',
  BrowseCategoriesStatus.success: 'success',
  BrowseCategoriesStatus.failure: 'failure',
};
