import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitState());

  void increment() {
    final currentState = state;
    if (currentState is CounterUpdate) {
      if (currentState.count >= 10) {
        emit(currentState.copyWith(erroreMessage: 'Maimum atteint!'));
        return;
      }
      emit(CounterUpdate(count: currentState.count + 1, erroreMessage: null));
    } else {
      emit(const CounterUpdate(count: 1, erroreMessage: null));
    }
  }

  void decrement() {
    final currentState = state;
    if (currentState is CounterUpdate) {
      if (currentState.count <= 0) {
        emit(currentState.copyWith(erroreMessage: 'Minimum atteint!'));
        return;
      }
      emit(CounterUpdate(count: currentState.count - 1, erroreMessage: null));
    }
  }
}

