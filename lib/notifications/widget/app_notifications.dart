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
                    content: _getNotificationContent(
                      state.appEvent,
                      context,
                    ),
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

  Widget _getNotificationContent(
    AppEvent? appEvent,
    BuildContext context,
  ) {
    if (appEvent == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(59, 96, 106, 0.25),
            blurRadius: 12,
            offset: Offset(0, 1),
          ),
        ],
      ),
      height: 107,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Error',
                style: AppFonts.headingH3,
              ),
              GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  child: const Icon(Icons.close)),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              switch (appEvent.runtimeType) {
                SnackBarErrorNotification =>
                  (appEvent as SnackBarErrorNotification).message,
                SnackBarWarningNotification =>
                  (appEvent as SnackBarWarningNotification).message,
                SnackBarSuccessNotification =>
                  (appEvent as SnackBarSuccessNotification).message,
                _ => throw Exception('Unknown event type: $appEvent'),
              },
              style: AppFonts.bodyS,
            ),
          ),
        ],
      ),
    );
  }
}
