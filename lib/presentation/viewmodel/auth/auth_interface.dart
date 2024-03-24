////////
abstract class AuthIface {
  Future<bool> login(String email, String password);
  Future<void> logout();
  Future<bool> signup(String email, String password);

  Future<bool> loginWithGoogle();
}
