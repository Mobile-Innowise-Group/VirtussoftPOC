import 'dart:async';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';

part 'user_data_event.dart';

part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final AppRouter _appRouter;
  final AppEventNotifier _appEventNotifier;
  final BiometricService _biometricService;

  UserDataBloc({
    required AppRouter appRouter,
    required AppEventNotifier appEventNotifier,
    required BiometricService biometricService,
  })  : _appRouter = appRouter,
        _appEventNotifier = appEventNotifier,
        _biometricService = biometricService,
        super(UserDataState());
}
