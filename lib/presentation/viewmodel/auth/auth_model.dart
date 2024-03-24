part of 'auth.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;

abstract interface class Auth {
  factory Auth.signedIn({
    required int id,
    required String displayName,
    required String email,
    required String token,
  }) =>
      SignedIn(
        id: id,
        displayName: displayName,
        email: email,
        token: token,
      );
  factory Auth.signedOut() => SignedOut();

  bool get isAuth;

  TResult map<TResult extends Object?>({
    required TResult Function(SignedIn value) signedIn,
    required TResult Function(SignedOut value) signedOut,
  });
}

class SignedIn implements Auth {
  final int id;
  final String displayName;
  final String email;
  final String token;

  SignedIn({required this.id, required this.displayName, required this.email, required this.token});

  @override
  bool get isAuth => true;

  @override
  TResult map<TResult extends Object?>({
    required TResult Function(SignedIn value) signedIn,
    required TResult Function(SignedOut value) signedOut,
  }) =>
      signedIn(this);
}

class SignedOut implements Auth {
  @override
  bool get isAuth => false;

  @override
  TResult map<TResult extends Object?>({
    required TResult Function(SignedIn value) signedIn,
    required TResult Function(SignedOut value) signedOut,
  }) =>
      signedOut(this);
}

/// Simple mock of a 401 exception
class UnauthorizedException implements Exception {
  const UnauthorizedException(this.message);
  final String message;
}

/// Mock of the duration of a network request
final networkRoundTripTime = 2.secs;

/// FirebaseAuth Exception code 별 message
final authReasonMap = {
  /// using in [signInWithCredential]
  'account-exists-with-different-credential':
      'there already exists an account with the email address asserted by the credential.',
  'invalid-credential': 'the credential is malformed or has expired.',
  'operation-not-allowed': 'the type of account corresponding to the credential is not enabled.',

  /// using in [signInWithEmailAndPassword] and [signInWithCredential]
  'user-disabled': 'the user corresponding to the given credential has been disabled.',

  /// using in [signInWithEmailAndPassword] and [signInWithCredential]
  'user-not-found':
      'signing in with a credential from [EmailAuthProvider.credential] and there is no user corresponding to the given email',
  'wrong-password':
      'signing in with a credential from [EmailAuthProvider.credential] and the password is invalid for the given email, or if the account corresponding to the email does not have a password set.',
  'invalid-verification-code':
      'the credential is a [PhoneAuthProvider.credential] and the verification code of the credential is not valid.',
  'invalid-verification-id':
      'the credential is a [PhoneAuthProvider.credential] and the verification ID of the credential is not valid.id.',

  /// using in [signInWithEmailAndPassword]
  'invalid-email': 'The email address is not valid.',

  /// using in [signInWithCustomToken]
  'custom-token-mismatch': 'The token is for a different Firebase App.',
  'invalid-custom-token': 'The token format is incorrect.',

  /// using in [createUserWithEmailAndPassword]
  'weak-password': 'The password provided is too weak.',
  'email-already-in-use': 'The account already exists for that email.',
};

extension ReasonExts on Map<String, String> {
  String operator [](String key) => this[key] ?? 'Unknown Reason';
}
