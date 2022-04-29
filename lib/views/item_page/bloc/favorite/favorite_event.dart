part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class Favorite extends FavoriteEvent {
  final Product? product;

  const Favorite(this.product);

  @override
  List<Object?> get props => [product];
}

class UnFavorite extends FavoriteEvent {
  final Product? product;

  const UnFavorite(this.product);

  @override
  List<Object?> get props => [product];
}
