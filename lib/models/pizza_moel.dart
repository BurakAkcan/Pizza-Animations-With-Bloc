import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Pizza extends Equatable {
  final String id;
  final String name;
  final Image image;

  Pizza({required this.id, required this.name, required this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, image];
  static List<Pizza> pizzas = [
    Pizza(
        id: '0', name: 'Pizza', image: Image.asset('assets/images/pizza.jpeg')),
    Pizza(
        id: '1',
        name: 'Pepperoni',
        image: Image.asset('assets/images/pizza2.jpeg'))
  ];
}
