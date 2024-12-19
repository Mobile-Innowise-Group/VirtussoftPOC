part of 'app_notifications_bloc.dart';

class AppNotificationsState {
  final AppEvent? appEvent;

  const AppNotificationsState({
    this.appEvent,
  });

  AppNotificationsState copyWith({
    AppEvent? appEvent,
  }) {
    return AppNotificationsState(
      appEvent: appEvent,
    );
  }
}
