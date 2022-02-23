import 'package:bloc/bloc.dart';
import 'package:fruit_store_app/models/product.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingState(rating: 0.0));

  void addRating(double value) {
    emit(RatingState(rating: value));
  }
}
