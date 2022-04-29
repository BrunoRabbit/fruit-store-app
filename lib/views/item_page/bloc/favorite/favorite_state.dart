part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final List<Product> product;

  const FavoriteState(
    this.product,
  );

  FavoriteState copyWith({Product? product}) {
    return FavoriteState(this.product);
  }

  @override
  List<Object?> get props => [product];
}
