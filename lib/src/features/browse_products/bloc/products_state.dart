part of 'products_bloc.dart';

enum BrowseStatus {
  @JsonValue('initial')
  initial,
  @JsonValue('success')
  success,
  @JsonValue('failure')
  failure,
}

@JsonSerializable()
class BrowseState extends Equatable {
  @JsonKey(name: 'status')
  final BrowseStatus status;
  final List<Product> products;
  final bool hasReachedMax;

  const BrowseState({
    this.status = BrowseStatus.initial,
    this.products = const <Product>[],
    this.hasReachedMax = false,
  });

  BrowseState copyWith({
    BrowseStatus? status,
    List<Product>? products,
    bool? hasReachedMax,
  }) {
    return BrowseState(
      status: status ?? this.status,
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''ProductState { status: $status, hasReachedMax: $hasReachedMax, products: ${products.length} }''';
  }

  @override
  List<Object> get props => [status, products, hasReachedMax];

  factory BrowseState.fromMap(Map<String, dynamic> map) =>
      _$BrowseStateFromJson(map);

  Map<String, dynamic> toMap() => _$BrowseStateToJson(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrowseState _$BrowseStateFromJson(Map<String, dynamic> json) {
  return BrowseState(
    status: _$enumDecode(_$BrowseStatusEnumMap, json['status']),
    products: (json['products'] as List<dynamic>)
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList(),
    hasReachedMax: json['hasReachedMax'] as bool,
  );
}

Map<String, dynamic> _$BrowseStateToJson(BrowseState instance) =>
    <String, dynamic>{
      'status': _$BrowseStatusEnumMap[instance.status],
      'products': instance.products,
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

const _$BrowseStatusEnumMap = {
  BrowseStatus.initial: 'initial',
  BrowseStatus.success: 'success',
  BrowseStatus.failure: 'failure',
};
