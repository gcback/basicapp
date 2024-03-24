import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth.dart';
import 'auth_interface.dart';
import '../../pages/component.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController implements AuthIface {
  @override
  Future<Auth> build() async {
    return _loginRecoveryAttempt();
  }

  Future<Auth> _loginRecoveryAttempt() async {
    if (auth.currentUser case var user?) {
      return Auth.signedIn(
        id: user.hashCode,
        email: user.email ?? '',
        token: (await user.getIdToken()) ?? '',
        displayName: user.displayName ?? '',
      );
    }

    return Auth.signedOut();
  }

  ///
  @override
  Future<bool> login(String email, String password) async {
    try {
      final userCredential = await signinWithEmail(email, password);

      if (userCredential.user case var user?) {
        state = AsyncData(
          Auth.signedIn(
            id: user.hashCode,
            email: user.email ?? '',
            token: (await user.getIdToken()) ?? '',
            displayName: user.displayName ?? '',
          ),
        );

        return true;
      }
    } on UnauthorizedException catch (e) {
      showSnackBar(e.message);
    }

    return false;
  }

  @override
  Future<void> logout() async {
    await Future<void>.delayed(networkRoundTripTime);

    await auth.signOut();

    state = AsyncData(Auth.signedOut());
  }

  @override
  Future<bool> signup(String email, String password) async {
    



    try {
      final userCredential = await signupWithEmail(email, password);

      if (userCredential?.user case var user?) {
        state = AsyncData(
          Auth.signedIn(
            id: user.hashCode,
            email: user.email ?? '',
            token: (await user.getIdToken()) ?? '',
            displayName: user.displayName ?? '',
          ),
        );

        return true;
      }
    } on UnauthorizedException catch (e) {
      showSnackBar('cannot create an account: ${e.message}');
    }

    return false;
  }

  @override
  Future<bool> loginWithGoogle() async {
    try {
      final userCredential = await signInWithGoogle();

      if (userCredential?.user case var user?) {
        state = AsyncData(
          Auth.signedIn(
            id: user.hashCode,
            email: user.email ?? '',
            token: (await user.getIdToken()) ?? '',
            displayName: user.displayName ?? '',
          ),
        );

        return true;
      }
    } catch (e) {
      showSnackBar('cannot login: ${e.toString()}');
    }

    return false;
  }
}
