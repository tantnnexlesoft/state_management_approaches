import 'dart:async';

abstract class RemoteEvent {}

class IncrementEvent extends RemoteEvent {
  IncrementEvent(this.increment);

  final int increment;
}

class RemoteState {
  RemoteState(this.counter);

  final int? counter;
}



class DecrementEvent extends RemoteEvent {
  DecrementEvent(this.decrement);

  final int decrement;
}


class RemoteBloc {
  var state = RemoteState(0);

  final eventController = StreamController<RemoteEvent>();

  final stateController = StreamController<RemoteState>();

  RemoteBloc() {
    eventController.stream.listen((RemoteEvent event) {
      if (event is IncrementEvent) {
        state = RemoteState(state.counter! + event.increment);
      } else if (event is DecrementEvent) {
        state = RemoteState(state.counter! - event.decrement);
      }
      stateController.sink.add(state);
    });
  }

  void dispose() {
    stateController.close();
    eventController.close();
  }
}
