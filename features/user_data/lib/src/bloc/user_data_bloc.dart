import 'dart:async';

import 'package:core/core.dart';
import 'package:meta/meta.dart';

part 'user_data_event.dart';

class UserDataBloc extends Bloc<UserDataEvent, int> {
  UserDataBloc() : super(0) {
    on<ToggleViewButtonEvent>(_onToggleViewButton);
  }

  FutureOr<void> _onToggleViewButton(
    ToggleViewButtonEvent event,
    Emitter<int> emit,
  ) {
    emit(event.index);
  }
}
