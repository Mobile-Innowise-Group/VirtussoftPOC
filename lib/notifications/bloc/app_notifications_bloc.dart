import 'dart:async';

import 'package:core/core.dart';
import 'package:meta/meta.dart';

part 'app_notifications_event.dart';

part 'app_notifications_state.dart';

class AppNotificationsBloc
    extends Bloc<AppNotificationsEvent, AppNotificationsState> {
  final AppEventObserver _appEventObserver;

  StreamSubscription<AppEvent>? _eventsSubscription;

  AppNotificationsBloc({required AppEventObserver appEventObserver})
      : _appEventObserver = appEventObserver,
        super(const AppNotificationsState()) {
    on<ShowNotificationEvent>(_onShowNotification);
    on<CloseSubscriptionEvent>(_onCloseSubscription);

    _eventsSubscription = _appEventObserver.observe<AppEvent>(
      (AppEvent event) => add(ShowNotificationEvent(appEvent: event)),
    );
  }

  FutureOr<void> _onShowNotification(
      ShowNotificationEvent event, Emitter<AppNotificationsState> emit) {
    emit(state.copyWith(appEvent: event.appEvent));
  }

  FutureOr<void> _onCloseSubscription(
      CloseSubscriptionEvent event, Emitter<AppNotificationsState> emit) {
    _eventsSubscription?.cancel();
    emit(const AppNotificationsState());
  }
}
