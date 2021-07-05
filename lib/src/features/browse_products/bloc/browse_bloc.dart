import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:browse_products_repository/browse_products_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:models/models.dart';
import 'package:rxdart/rxdart.dart';

part 'browse_event.dart';
part 'browse_state.dart';

const _productsLimit = 10;

class BrowseBloc extends Bloc<BrowseEvent, BrowseState> {
  BrowseBloc() : super(BrowseState());

  final browseRepo = BrowseProductsRepository();

  @override
  Stream<Transition<BrowseEvent, BrowseState>> transformEvents(
    Stream<BrowseEvent> events,
    TransitionFunction<BrowseEvent, BrowseState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<BrowseState> mapEventToState(
    BrowseEvent event,
  ) async* {
    if (event is ProductFetched) {
      yield await _mapProductFetchedToState();
    }
    // else if (event is CategoryFetched) {
    //   yield await _mapCategoryFetchedToState();
    // }
  }

  Future<BrowseState> _mapProductFetchedToState() async {
    if (state.hasReachedMax) return state;

    try {
      if (state.status == BrowseStatus.initial) {
        final products = await _fetchProducts();
        return state.copyWith(
          status: BrowseStatus.success,
          products: products,
          hasReachedMax: products.length < _productsLimit,
        );
      }
      final products = await _fetchProducts(state.products.length);
      return products.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: BrowseStatus.success,
              products: List.of(state.products)..addAll(products),
              hasReachedMax: false,
            );
    } catch (e) {
      return state.copyWith(status: BrowseStatus.failure);
    }
  }

  Future<List<Product>> _fetchProducts([int startIndex = 0]) async {
    Map<String, dynamic> qryParams = {
      'start': startIndex,
      'limit': _productsLimit,
    };
    return browseRepo.getProducts(qry: qryParams);
  }

  // @override
  // BrowseState? fromJson(Map<String, dynamic> json) => BrowseState.fromMap(json);

  // @override
  // Map<String, dynamic>? toJson(BrowseState state) => state.toMap();
}
