import 'package:bloc/bloc.dart';

part 'progress_bar_state.dart';

class ProgressBarCubit extends Cubit<ProgressBarState> {
  ProgressBarCubit()
      : super(ProgressBarState(
          currentIndex: 1,
          isLastIndex: false,
        ));

  void previousWelcomeStep() {
    if (state.currentIndex == 1) {
      return;
    } else {
      emit(
        ProgressBarState(
          currentIndex: state.currentIndex - 1,
          isLastIndex: false,
        ),
      );
    }
  }

  void nextWelcomeStep() {
    if (state.currentIndex == 3) {
      ProgressBarState(
        currentIndex: state.currentIndex,
        isLastIndex: true,
      );
    } else {
      emit(
        ProgressBarState(
          currentIndex: state.currentIndex + 1,
          isLastIndex: false,
        ),
      );
    }
  }
}
