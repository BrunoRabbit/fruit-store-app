import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/models/cart_model.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/repositories/shopping_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ShoppingRepository shoppingRepository;

  CartBloc({required this.shoppingRepository}) : super(CartLoading()) {
    on<CartStarted>((event, emit) async {
      emit(CartLoading());
      try {
        final products = await shoppingRepository.loadCartProducts();
        emit(CartLoaded(cartModel: CartModel(products: [...products])));
      } catch (_) {
        emit(CartError());
      }
    });

    on<CartItemAdded>((event, emit) {
      final state = this.state;
      if (state is CartLoaded) {
        try {
          shoppingRepository.addProductToCart(event.product);
          emit(CartLoaded(
              cartModel: CartModel(
                  products: [...state.cartModel.products, event.product])));
        } catch (_) {
          emit(CartError());
        }
      }
    });

    on<CartItemRemoved>((event, emit) {
      final state = this.state;
      if (state is CartLoaded) {
        try {
          shoppingRepository.removeProductFromCart(event.product);
          emit(
            CartLoaded(
              cartModel: CartModel(
                products: [...state.cartModel.products]..remove(event.product),
              ),
            ),
          );
        } catch (_) {
          emit(CartError());
        }
      }
    });
  }
}
