part of 'app_notifications_bloc.dart';

@immutable
sealed class AppNotificationsEvent {
  const AppNotificationsEvent();
}

class ShowNotificationEvent extends AppNotificationsEvent {
  final AppEvent appEvent;

  const ShowNotificationEvent({
    required this.appEvent,
  });
}

class CloseSubscriptionEvent extends AppNotificationsEvent {
  const CloseSubscriptionEvent();
}
