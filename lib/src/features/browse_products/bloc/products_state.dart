part of 'products_bloc.dart';

//enum
enum BrowseStatus {
  initial,
  success,
  failure,
}

@JsonSerializable()
class BrowseState extends Equatable {
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

  // factory BrowseState.fromMap(Map<String, dynamic> map) => _$BrowseStateFromJson(map);

  // Map<String, dynamic> toMap() => _$BrowseStateToJson(this);

  // Map<String, dynamic> toMap() {
  //   return {
  //     'status': status,
  //     'products': products.map((x) => x.toMap()).toList(),
  //     'hasReachedMax': hasReachedMax,
  //   };
  // }

  // factory BrowseState.fromMap(Map<String, dynamic> map) {
  //   return BrowseState(
  //     status: map['status'],
  //     products:
  //         List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
  //     hasReachedMax: map['hasReachedMax'],
  //   );
  // }
}
