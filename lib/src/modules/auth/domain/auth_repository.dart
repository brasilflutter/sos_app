import 'entities/auth_credential_entity.dart';
import 'entities/sign_in_params_entity.dart';
import 'entities/sign_up_params_entity.dart';

abstract class AuthRepository {
  Future<AuthCredentialEntity> signInWithEmailAndPassword(
    SignInParamsEntity params,
  );

  Future<AuthCredentialEntity> signInWithGoogle();

  Future<AuthCredentialEntity> signInWithApple();

  Future<AuthCredentialEntity> signInWithToken(String token);

  Future<AuthCredentialEntity> signUpWithEmailAndPassword(
    SignUpParamsEntity params,
  );

  Future<void> signOut();
}
