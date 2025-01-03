part of 'user_profile_bloc.dart';

@immutable
sealed class UserProfileEvent {}

final class InitUserProfileEvent extends UserProfileEvent {}

final class SignOutEvent extends UserProfileEvent {}
