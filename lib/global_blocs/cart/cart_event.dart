part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartStarted extends CartEvent {
  @override
  List<Object?> get props => [];
}

class CartItemAdded extends CartEvent {
  final Product product;

  const CartItemAdded(this.product);

  @override
  List<Object?> get props => [product];
}

class CartItemRemoved extends CartEvent {
  final Product product;
  const CartItemRemoved(this.product);

  @override
  List<Object?> get props => [product];
}
