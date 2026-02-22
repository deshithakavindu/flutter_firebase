import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_firebase/blocs/counter/counter_event.dart';
import 'package:demo_firebase/blocs/counter/counter_state.dart';
import 'package:meta/meta.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterIncrementpressed>((event, emit) {
      emit(CounterState(state.count + 1));
    });

    on<CounterDecrementpressed>((event, emit) {
      emit(CounterState(state.count - 1));
    });
  }
}
