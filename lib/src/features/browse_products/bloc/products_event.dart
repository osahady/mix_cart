part of 'products_bloc.dart';

abstract class BrowseEvent extends Equatable {
  const BrowseEvent();

  @override
  List<Object> get props => [];
}

class ProductFetched extends BrowseEvent {}
