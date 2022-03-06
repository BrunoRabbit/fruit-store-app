part of 'progress_bar_bloc.dart';

abstract class ProgressBarEvent {}

class ChangeStepBarEvent extends ProgressBarEvent {
  final int step;

  ChangeStepBarEvent(
    this.step,
  );
}
