part of 'progress_bloc.dart';

abstract class ProgressState extends Equatable {
  const ProgressState();

  @override
  List<Object> get props => [];
}

class ProgressInitial extends ProgressState {}

class ProgressLoading extends ProgressState {
  final int percentage;

  ProgressLoading(this.percentage);

  @override
  List<Object> get props => [percentage];
}

class ProgressLoaded extends ProgressState {}
