import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzabloc/bloc/pizza_bloc.dart';

import '../models/pizza_moel.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza Bloc'),
        centerTitle: true,
      ),
      body: Center(child: BlocBuilder<PizzaBloc, PizzaState>(
        builder: (context, state) {
          if (state is PizzaInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PizzaLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.pizzas.length.toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      for (int i = 0; i < state.pizzas.length; i++)
                        Positioned(
                          left: random.nextInt(250).toDouble(),
                          top: random.nextInt(400).toDouble(),
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: state.pizzas[i].image,
                          ),
                        )
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('Something went Wrong'),
            );
          }
        },
      )),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          heroTag: '1',
          child: const Icon(Icons.local_pizza_outlined),
          onPressed: () {
            context.read<PizzaBloc>().add(AddPizzaEvent(Pizza.pizzas[0]));
          },
        ),
        FloatingActionButton(
          heroTag: '2',
          child: const Icon(Icons.local_pizza),
          onPressed: () {
            context.read<PizzaBloc>().add(RemovePizzaEvent(Pizza.pizzas[0]));
          },
        ),
        FloatingActionButton(
          heroTag: '3',
          child: const Icon(Icons.local_pizza_sharp),
          onPressed: () {
            context.read<PizzaBloc>().add(AddPizzaEvent(Pizza.pizzas[1]));
          },
        ),
        FloatingActionButton(
          heroTag: '4',
          child: const Icon(Icons.local_pizza_rounded),
          onPressed: () {
            context.read<PizzaBloc>().add(RemovePizzaEvent(Pizza.pizzas[1]));
          },
        ),
      ]),
    );
  }
}
