import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'demo_event.dart';
part 'demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc() : super(DemoInitial()) {
    on<DemoEvent>((event, emit) {
      if (event is FabButtonPressed) {
        final response = _workForFetchingMovie(event.name);
        emit(MovieLoaded(response));
      } else if (event is NotificationButtonPressed) {
        _fetchNotification();
      }
      print(event);
    });
  }

  String _workForFetchingMovie(String name) {
    return "$name is very awesome movie";
  }

  void _fetchNotification() {}
}
