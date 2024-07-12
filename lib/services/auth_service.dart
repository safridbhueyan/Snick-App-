import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
//google sign in

  signInWithGoogle() async {
// begin sign in pop ups
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
//obtain auth detail from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
//create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
//finally lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
