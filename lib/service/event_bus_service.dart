import 'package:example_event_bus/model/app_event.dart';
import 'package:get/state_manager.dart';

class EventBusService extends GetxService {
  final _eventStream = Rx<AppEvent?>(null);

  void emit(AppEvent event) {
    _eventStream.value = event;
  }

  Stream<T> on<T extends AppEvent>() {
    return _eventStream.stream.where((event) => event is T).map((event) => event as T);
  }
}
