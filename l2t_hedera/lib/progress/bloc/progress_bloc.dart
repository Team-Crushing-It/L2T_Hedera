import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:l2t_hedera/progress/progress.dart';

part 'progress_event.dart';
part 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  final Progress progress;
  ProgressBloc(this.progress) : super(ProgressInitial());
  StreamSubscription<int> _progressSubscription;

  @override
  Stream<ProgressState> mapEventToState(
    ProgressEvent event,
  ) async* {
    if (event is ProgressStarted) {
      _progressSubscription?.cancel();
      _progressSubscription =
          progress.tick().listen((duration) => add(ProgressUpdated(duration)));
    } else if (event is ProgressUpdated) {
      yield ProgressLoading(event.count);

      if (event.count == 10) {
        yield ProgressLoaded();
      }
    }
  }

  @override
  Future<void> close() {
    _progressSubscription?.cancel();
    return super.close();
  }
}
