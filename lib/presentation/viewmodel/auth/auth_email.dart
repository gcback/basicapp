part of 'auth.dart';

const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

Future<UserCredential?> signupWithEmail(String email, String password) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential;
  } on FirebaseAuthException catch (e) {
    throw UnauthorizedException('createUserWithEmailAndPassword failed: ${authReasonMap[e.code]}');
  }
}

Future<UserCredential> signinWithEmail(String email, String password) async {
  try {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    throw UnauthorizedException('signInWithEmailAndPassword failed: ${authReasonMap[e.code]}');
  }
}
