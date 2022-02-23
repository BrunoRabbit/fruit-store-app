import 'package:bloc/bloc.dart';

class ProgressBarCubit extends Cubit<int> {
  ProgressBarCubit() : super(1);

  void previousWelcomeStep() {
    if (state == 1) {
      return;
    } else {
      emit(state - 1);
    }
  }

  void nextWelcomeStep() {
    if (state == 3) {
      return;
    } else {
      emit(state + 1);
    }
  }
}
