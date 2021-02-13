part of 'progress_bloc.dart';

abstract class ProgressEvent extends Equatable {
  const ProgressEvent();

  @override
  List<Object> get props => [];
}

class ProgressStarted extends ProgressEvent {}

class ProgressUpdated extends ProgressEvent {
  final int count;

  ProgressUpdated(this.count);
}
