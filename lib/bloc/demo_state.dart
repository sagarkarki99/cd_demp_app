part of 'demo_bloc.dart';

@immutable
abstract class DemoState {}

class DemoInitial extends DemoState {}

class MovieLoaded extends DemoState {
  final String message;

  MovieLoaded(this.message);
}
