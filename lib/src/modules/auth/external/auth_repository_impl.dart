import '../domain/auth_repository.dart';
import '../domain/entities/auth_credential_entity.dart';
import '../domain/entities/sign_in_params_entity.dart';
import '../domain/entities/sign_up_params_entity.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<AuthCredentialEntity> signInWithApple() {
    throw UnimplementedError();
  }

  @override
  Future<AuthCredentialEntity> signInWithEmailAndPassword(
    SignInParamsEntity params,
  ) async {
    return const AuthCredentialEntity(
      token: '',
      refreshToken: '',
    );
  }

  @override
  Future<AuthCredentialEntity> signInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<AuthCredentialEntity> signInWithToken(String token) async {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    return;
  }

  @override
  Future<AuthCredentialEntity> signUpWithEmailAndPassword(
    SignUpParamsEntity params,
  ) async {
    return const AuthCredentialEntity(
      token: '',
      refreshToken: '',
    );
  }
}
