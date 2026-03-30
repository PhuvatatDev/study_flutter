import "package:equatable/equatable.dart";

abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object?> get props => [];
}

class CounterInitState extends CounterState {
  const CounterInitState();
}

class CounterUpdate extends CounterState {
  final int count;
  final String? erroreMessage;

  const CounterUpdate({required this.count, required this.erroreMessage});

  @override
  List<Object?> get props => [count, erroreMessage];

  CounterUpdate copyWith({int? count, String? erroreMessage}) {
    return CounterUpdate(
        count: count ?? this.count,
        erroreMessage: erroreMessage ?? this.erroreMessage);
  }
}
