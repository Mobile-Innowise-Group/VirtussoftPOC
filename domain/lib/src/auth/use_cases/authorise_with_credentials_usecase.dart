import '../../../domain.dart';

class SignInWithCredentialsUseCase
    implements FutureUseCase<SignInPayloadModel, UserModel?> {
  final AuthorizationRepository _authRepository;

  SignInWithCredentialsUseCase({
    required AuthorizationRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<UserModel?> execute(SignInPayloadModel input) async {
    return _authRepository.signInWithCredentials(signInPayloadModel: input);
  }
}
