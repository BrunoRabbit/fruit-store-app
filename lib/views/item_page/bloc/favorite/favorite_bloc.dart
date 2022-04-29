import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/controllers/home_page_controller.dart';
import 'package:fruit_store_app/models/product.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

// ListProductState get fruitsList => fruitsList;
HomePageController _controller = HomePageController();

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState(_controller.fruitsList)) {
    on<Favorite>((event, emit) {
      final myProduct = state.product;

      final currentProduct = myProduct.where(
        (element) => element.name == event.product!.name,
      );

      var selectedProduct = myProduct.elementAt(
        myProduct.indexOf(
          currentProduct.elementAt(event.product!.id),
        ),
      );
      // myProduct.elementAt(myProduct.indexOf(currentProduct));
      emit(state.copyWith(
        product: selectedProduct,
      ));
    });

    on<UnFavorite>((event, emit) {
      emit(state.copyWith(
        product: Product(isFavorite: false),
      ));
      // emit(FavoriteState(Product(isFavorite: false,)));
    });
  }
}
