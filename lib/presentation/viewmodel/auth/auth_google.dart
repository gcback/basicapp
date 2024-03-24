part of 'auth.dart';

Future<UserCredential?> signInWithGoogle() async {
  try {
    // Trigger the authentication flow
    // and get a GoogleSignInAccount
    final googleUser = await GoogleSignIn(scopes: scopes).signIn();

    if (googleUser case var googleUser?) {
      // Obtain the auth details( GoogleSignInAuthentication? ) from the request
      final googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await auth.signInWithCredential(credential);
    }

    throw Exception('sign in process was aborted.');
  } on FirebaseAuthException catch (e) {
    throw UnauthorizedException(
      'signInWithGoogle: ${authReasonMap[e.code]}',
    );
  }
}
