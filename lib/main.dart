// Flutter BLoC
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: Scaffold(
          body: Center(
            child: BlocBuilder<CounterCubit, int>(
              builder: (context, count) => Text('Count: $count'),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
