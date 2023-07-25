import 'package:absensi_web_admin/app/app.supabase.dart';

class AuthenticationService {
  bool userLoggedIn() {
    final session = supabase.auth.currentSession;
    return session != null;
  }

  Future<bool> useSignIn(String email, String password) async {
    try {
      await supabase.auth
          .signInWithPassword(email: email.trim(), password: password);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> useSignOut() async {
    await supabase.auth.signOut();
  }
}
