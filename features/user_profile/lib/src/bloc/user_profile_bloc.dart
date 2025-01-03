import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final AppRouter _appRouter;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final SignOutUseCase _signOutUseCase;

  UserProfileBloc({
    required AppRouter appRouter,
    required GetCurrentUserUseCase getCurrentUserUseCase,
    required SignOutUseCase signOutUseCase,
  })  : _getCurrentUserUseCase = getCurrentUserUseCase,
        _signOutUseCase = signOutUseCase,
        _appRouter = appRouter,
        super(const UserProfileLoadingState()) {
    on<InitUserProfileEvent>(_onInitUserProfileEvent);
    on<SignOutEvent>(_onSignOut);
  }

  void _onInitUserProfileEvent(
    InitUserProfileEvent event,
    Emitter<UserProfileState> emit,
  ) {
    final UserModel? currentUser = _getCurrentUserUseCase.execute(const NoParams());

    if (currentUser == null) {
      emit(
        const UserProfileErrorState(errorMessage: 'Cannot fetch user'),
      );
      return;
    }
    emit(
      UserProfileSuccessState(userModel: currentUser),
    );
  }

  Future<void> _onSignOut(
    SignOutEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    await _signOutUseCase.execute(const NoParams());

    await _appRouter.replace(const LoginRoute());
  }
}
