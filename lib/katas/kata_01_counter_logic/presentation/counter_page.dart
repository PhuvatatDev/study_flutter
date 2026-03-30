import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';
import 'counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Kata 01 - Counter')),
        body: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            int count = 0;
            String? errorMessage;

            if (state is CounterUpdate) {
              count = state.count;
              errorMessage = state.erroreMessage;
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$count',
                    style: const TextStyle(fontSize: 48),
                  ),
                  const SizedBox(height: 16),
                  if (errorMessage != null)
                    Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            context.read<CounterCubit>().decrement(),
                        child: const Text('-'),
                      ),
                      const SizedBox(width: 24),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<CounterCubit>().increment(),
                        child: const Text('+'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
