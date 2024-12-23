import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/app_notifications_bloc.dart';

class AppNotifications extends StatelessWidget {
  final Widget child;

  const AppNotifications({
    super.key,
    required this.child,
  });

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
        return AwesomeSnackbarContent(
          contentType: ContentType.failure,
          title: 'Error',
          message: (appEvent as SnackBarErrorNotification).message,
        );
      case SnackBarSuccessNotification:
        return AwesomeSnackbarContent(
          contentType: ContentType.success,
          title: 'Success',
          message: (appEvent as SnackBarSuccessNotification).message,
        );
      case SnackBarWarningNotification:
        return AwesomeSnackbarContent(
          contentType: ContentType.warning,
          title: 'Warning',
          message: (appEvent as SnackBarWarningNotification).message,
        );
    }
    return const SizedBox.shrink();
  }
}
