part of 'categories_bloc.dart';

abstract class BrowseCategoriesEvent extends Equatable {
  const BrowseCategoriesEvent();

  @override
  List<Object> get props => [];
}

class CategoryFetched extends BrowseCategoriesEvent {}
