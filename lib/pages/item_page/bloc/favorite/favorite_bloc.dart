import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/data/data.dart';
import 'package:fruit_store_app/models/product.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState(productList: fruitsList)) {
    on<FavoriteItem>((event, emit) {
      var newList = state.productList;
      // var selectedProduct = newList.where((e) => e.id == event.product.id);

      // newList[newList.indexOf(selectedProduct)] = Product(
      //   id: event.product.id,
      //   isFavorite: event.newFavorite,
      // );

      newList.elementAt(event.product.id) ==
          Product(
            id: event.product.id,
            isFavorite: event.newFavorite,
          );

      emit(state.copyWith(productList: newList));
    });
  }
}
