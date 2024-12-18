import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import '../bloc/app_notifications_bloc.dart';

class AppNotifications extends StatelessWidget {
  final Widget child;

  const AppNotifications({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppNotificationsBloc>(
      create: (_) => AppNotificationsBloc(
          appEventObserver: appLocator<AppEventObserver>()),
      child: Builder(
        builder: (BuildContext context) {
          return BlocListener<AppNotificationsBloc, AppNotificationsState>(
            listener: (BuildContext context, AppNotificationsState state) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    elevation: 0,
                    duration: const Duration(seconds: 20),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height - 200),
                    content: _getNotificationContent(state.appEvent),
                  ),
                  snackBarAnimationStyle:
                      AnimationStyle(duration: Duration.zero),
                );
            },
            child: child,
          );
        },
      ),
    );
  }

  Widget _getNotificationContent(AppEvent? appEvent) {
    if (appEvent == null) {
      return const SizedBox.shrink();
    }
    switch (appEvent.runtimeType) {
      case SnackBarErrorNotification:
       return const SizedBox();
      case SnackBarSuccessNotification:
        return const SizedBox();
      case SnackBarWarningNotification:
        return const SizedBox();
    }
    return const SizedBox.shrink();
  }
}
