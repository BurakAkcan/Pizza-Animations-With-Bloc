part of 'pizza_bloc.dart';

abstract class PizzaEvent extends Equatable {
  const PizzaEvent();

  @override
  List<Object> get props => [];
}

class LoadPizzaCounterEvent extends PizzaEvent {}

class AddPizzaEvent extends PizzaEvent {
  final Pizza pizza;

  AddPizzaEvent(this.pizza);
  @override
  List<Object> get props => [pizza];
}

class RemovePizzaEvent extends PizzaEvent {
  final Pizza pizza;

  RemovePizzaEvent(this.pizza);
  @override
  List<Object> get props => [pizza];
}
