part of 'favorite_bloc.dart';

class FavoriteState {
  final List<Product> productList;

  const FavoriteState({
    required this.productList,
  });

  FavoriteState copyWith({
    List<Product>? productList,
  }) {
    return FavoriteState(
      productList: productList ?? this.productList,
    );
  }
}
