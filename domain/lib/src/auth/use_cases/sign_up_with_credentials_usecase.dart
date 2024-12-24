import '../../../domain.dart';

class SignUpWithCredentialsUseCase
    implements FutureUseCase<SignUpPayloadModel, UserModel?> {
  final AuthorizationRepository _authRepository;

  SignUpWithCredentialsUseCase({
    required AuthorizationRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<UserModel?> execute(SignUpPayloadModel input) async {
    return _authRepository.signUpWithCredentials(signUpPayloadModel: input);
  }
}
