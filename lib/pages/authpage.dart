import 'package:addapp/pages/home_page.dart';
import 'package:addapp/pages/login_or_register_page.dart';
import 'package:addapp/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user logged in
            if (snapshot.hasData) {
              return HomePage();
            }
            //user mot logged in
            else {
              return LoginOrRegisterPage();
            }
          }),
    );
  }
}
