part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class FavoriteItem extends FavoriteEvent {
  final Product product;
  final bool newFavorite;

  FavoriteItem({
    required this.product,
    required this.newFavorite,
  });
}
