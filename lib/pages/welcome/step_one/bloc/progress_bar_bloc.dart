import 'package:bloc/bloc.dart';
import 'package:fruit_store_app/pages/welcome/step_one/bloc/progress_bar_state.dart';
part 'progress_bar_event.dart';

class ProgressBarBloc extends Bloc<ProgressBarEvent, ProgressBarState> {
  ProgressBarBloc() : super(ProgressBarState(0)) {
    on<ChangeStepBarEvent>((event, emit) {
      emit(
        ProgressBarState(event.step),
      );
    });
  }
}
