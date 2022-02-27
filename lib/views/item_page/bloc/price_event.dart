part of 'price_bloc.dart';

abstract class PriceEvent {}

class ChangePrice extends PriceEvent {
  Product product;
  int index;

  ChangePrice(
    this.product,
    this.index,
  );
}
