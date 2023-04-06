abstract class IUser {
  Future<void> signIn({required String email, required String password});
  Future<void> signUp({
    required String email,
    required String password,
    required String username,
    required String number,
  });
  Future<void> signOut();
}
