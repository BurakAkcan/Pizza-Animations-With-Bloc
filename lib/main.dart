import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzabloc/bloc/pizza_bloc.dart';
import 'package:pizzabloc/screens/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => PizzaBloc()..add(LoadPizzaCounterEvent()))
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomeView(),
      ),
    );
  }
}
