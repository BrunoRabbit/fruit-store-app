import 'package:bloc/bloc.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingState(rating: 0.0));

  void addRating(double value) {
    emit(RatingState(rating: value));
  }
}
