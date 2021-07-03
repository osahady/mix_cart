part of 'browse_bloc.dart';

enum BrowseStatus { initial, success, failure }

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
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, products: ${products.length} }''';
  }

  @override
  List<Object> get props => [status, products, hasReachedMax];
}
