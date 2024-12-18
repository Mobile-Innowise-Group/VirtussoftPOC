import '../ui_event.dart';

class SnackBarErrorNotification extends UiEvent {
  final String message;

  SnackBarErrorNotification({required this.message});
}

class SnackBarSuccessNotification extends UiEvent {
  final String message;

  SnackBarSuccessNotification({required this.message});
}

class SnackBarWarningNotification extends UiEvent {
  final String message;

  SnackBarWarningNotification({required this.message});
}
