import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_profile_event.dart';

part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileState.initial()) {
    on<UserProfileEvent>((
      UserProfileEvent event,
      Emitter<UserProfileState> emit,
    ) {
      // TODO: implement event handler
    });
  }
}
