import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rashi_network/utils/design_utlis.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;
  FirebaseAuth auth = FirebaseAuth.instance;
  final storage = const FlutterSecureStorage();

  Future<bool> phoneOPTVerify(String verificationId, String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await auth.signInWithCredential(credential);
      return true;
    } on FirebaseAuthException catch (e) {
      DesignUtlis.flutterToast(e.toString());
    }
    return false;
  }

  Future signOut() async {
    final firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut();
    await storage.deleteAll();
    await storage.delete(key: 'key');
  }
}
