part of 'user_profile_bloc.dart';

@immutable
sealed class UserProfileState {
  const UserProfileState();
}

final class UserProfileLoadingState extends UserProfileState {
  const UserProfileLoadingState();
}

final class UserProfileErrorState extends UserProfileState {
  final String errorMessage;

  const UserProfileErrorState({required this.errorMessage});
}

final class UserProfileSuccessState extends UserProfileState {
  final UserModel userModel;

  const UserProfileSuccessState({required this.userModel});
}
