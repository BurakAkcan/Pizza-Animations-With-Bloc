import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../models/pizza_moel.dart';

part 'pizza_event.dart';
part 'pizza_state.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc() : super(PizzaInitial()) {
    on<LoadPizzaCounterEvent>(
      (event, emit) async {
        await Future.delayed(const Duration(seconds: 2));
        emit(PizzaLoaded(pizzas: <Pizza>[]));
      },
    );

    on<AddPizzaEvent>(
      (event, emit) {
        if (state is PizzaLoaded) {
          final state = this.state as PizzaLoaded;
          emit(PizzaLoaded(
            pizzas: List.from(state.pizzas)..add(event.pizza),
          ));
        }
      },
    );
    on<RemovePizzaEvent>(
      (event, emit) {
        if (state is PizzaLoaded) {
          final state = this.state as PizzaLoaded;
          emit(PizzaLoaded(
            pizzas: List.from(state.pizzas)..remove(event.pizza),
          ));
        }
      },
    );
  }
}
