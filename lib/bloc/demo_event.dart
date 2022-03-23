part of 'demo_bloc.dart';

@immutable
abstract class DemoEvent {}

class FabButtonPressed extends DemoEvent {
  final String movieId;
  final String name;

  FabButtonPressed({required this.movieId, required this.name});
}

class NotificationButtonPressed extends DemoEvent {}
