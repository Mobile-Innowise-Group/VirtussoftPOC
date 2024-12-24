import '../../../domain.dart';

class GetCurrentUserUseCase implements UseCase<NoParams, UserModel?> {
  final AuthorizationRepository _authRepository;

  GetCurrentUserUseCase({
    required AuthorizationRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  UserModel? execute(NoParams input) {
    return _authRepository.getCurrentUser();
  }
}
