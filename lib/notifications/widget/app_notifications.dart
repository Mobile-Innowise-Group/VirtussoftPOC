import 'package:core/core.dart';
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
              const SnackBar snackBar = SnackBar(
                content: Text('Hello, world!'),
                duration: Duration(seconds: 3),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
            },
            child: child,
          );
        },
      ),
    );
  }
}
