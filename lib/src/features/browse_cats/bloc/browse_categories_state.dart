part of 'browse_categories_bloc.dart';

enum BrowseCategoriesStatus { initial, success, failure }

class BrowseCategoriesState extends Equatable {
  final BrowseCategoriesStatus status;
  final List<Category> categories;
  final bool hasReachedMax;

  const BrowseCategoriesState({
    this.status = BrowseCategoriesStatus.initial,
    this.categories = const <Category>[],
    this.hasReachedMax = false,
  });

  BrowseCategoriesState copyWith({
    BrowseCategoriesStatus? status,
    List<Category>? categories,
    bool? hasReachedMax,
  }) {
    return BrowseCategoriesState(
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
}
