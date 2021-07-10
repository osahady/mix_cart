import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:browse_products_repository/browse_products_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:models/models.dart';
import 'package:rxdart/rxdart.dart';

part 'categories_event.dart';
part 'categories_state.dart';

const _categoriesLimit = 10;

class CategoriesBloc
    extends HydratedBloc<BrowseCategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesState());

  final browseRepo = BrowseProductsRepository();

  @override
  Stream<Transition<BrowseCategoriesEvent, CategoriesState>> transformEvents(
    Stream<BrowseCategoriesEvent> events,
    TransitionFunction<BrowseCategoriesEvent, CategoriesState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<CategoriesState> mapEventToState(
    BrowseCategoriesEvent event,
  ) async* {
    if (event is CategoryFetched) {
      yield await _mapCategoryFetchedToState();
    }
  }

  Future<CategoriesState> _mapCategoryFetchedToState() async {
    if (state.hasReachedMax) return state;

    try {
      if (state.status == BrowseCategoriesStatus.initial) {
        final categories = await _fetchCategories();
        return state.copyWith(
          status: BrowseCategoriesStatus.success,
          categories: categories,
          hasReachedMax: categories.length < _categoriesLimit,
        );
      }
      final categories = await _fetchCategories(state.categories.length);
      return categories.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: BrowseCategoriesStatus.success,
              categories: List.of(state.categories)..addAll(categories),
              hasReachedMax: false,
            );
    } catch (e) {
      return state.copyWith(status: BrowseCategoriesStatus.failure);
    }
  }

  Future<List<Category>> _fetchCategories([int startIndex = 0]) async {
    Map<String, dynamic> qryParams = {
      'offset': startIndex,
      'limit': _categoriesLimit,
    };
    return browseRepo.getCategories(qry: qryParams);
  }

  @override
  CategoriesState? fromJson(Map<String, dynamic> json) =>
      CategoriesState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(CategoriesState state) => state.toMap();
}
