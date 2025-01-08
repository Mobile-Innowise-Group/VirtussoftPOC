part of 'user_data_bloc.dart';

@immutable
sealed class UserDataEvent {}

class ToggleViewButtonEvent extends UserDataEvent {
  final int index;

  ToggleViewButtonEvent({
    required this.index,
  });
}
