import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/demo_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DemoBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<DemoBloc, DemoState>(
          listener: (context, state) {
            if (state is MovieLoaded) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("New movie came!!!"),
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<DemoBloc, DemoState>(
            builder: (context, state) {
              if (state is MovieLoaded) {
                return Text(state.message);
              }
              return const Text('No movie');
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          BlocProvider.of<DemoBloc>(context).add(FabButtonPressed(
            movieId: "Asdfasdfwerwe",
            name: "Iron man",
          ));
        },
      ),
    );
  }
}
