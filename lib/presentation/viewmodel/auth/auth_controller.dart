import 'package:mylib/mylib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../pages/component.dart';
import 'auth.dart';
import 'auth_persistance.dart';
import 'auth_persistance_shared_preference.dart';

part 'auth_controller.g.dart';

////////
abstract class AuthIface {
  Future<bool> login(String email, String password);
  Future<void> logout();
  Future<bool> signup(String email, String password);

  Future<bool> loginWithGoogle();
}

@riverpod
class AuthController extends _$AuthController implements AuthIface {
  static const _persistanceKey = 'token';
  late AuthPersistance _persistance;

  @override
  Future<Auth> build() async {
    _persistance = await ref.watch(sharedPreferencePersistanceProvider.future);

    // _persistenceRefreshLogic();

    return _loginRecoveryAttempt2();
  }

  Future<Auth> _loginRecoveryAttempt2() async {
    if (auth.currentUser case var user?) {
      print('recoverying an auth state...');

      return Auth.signedIn(
        id: user.hashCode,
        email: user.email ?? '',
        token: (await user.getIdToken()) ?? '',
        displayName: user.displayName ?? '',
      );
    }

    _persistance.remove(_persistanceKey);
    return Auth.signedOut();
  }

  void _persistenceRefreshLogic() {
    ref.listenSelf((_, AsyncValue<Auth> next) {
      switch (next) {
        case AsyncLoading():
        case AsyncError():
          _persistance.remove(_persistanceKey);
        default:
          next.requireValue.map<void>(
            signedIn: (signedIn) => _persistance.set(_persistanceKey, signedIn.token),
            signedOut: (signedOut) {
              _persistance.remove(_persistanceKey);
            },
          );
      }
    });
  }

  Future<Auth> _loginRecoveryAttempt() async {
    try {
      final savedToken = _persistance.get(_persistanceKey);

      if (savedToken case var savedToken?) {
        return _loginWithToken(savedToken);
      }

      /// splash delay mock
      await Future.delayed(1.secs);

      throw const UnauthorizedException('No auth token found');
    } catch (_, __) {
      _persistance.remove(_persistanceKey).ignore();

      return Future.value(Auth.signedOut());
    }
  }

  Future<Auth> _loginWithToken(String token) async {
    try {
      final userCredential = await signinWithToken(token);
      if (userCredential.user case var user?) {
        return Auth.signedIn(
          id: user.hashCode,
          email: user.email ?? '',
          token: (await user.getIdToken()) ?? '',
          displayName: user.displayName ?? '',
        );
      }
    } on UnauthorizedException catch (e) {
      showSnackBar(e.message);

      _persistance.remove(_persistanceKey).ignore();

      return Future.value(Auth.signedOut());
    }

    throw const UnauthorizedException('401 Unauthorized or something');
  }

  ///
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
