import 'package:addapp/pages/login_page.dart';
import 'package:addapp/pages/register_page.dart';

import 'authpage.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //initially show login page
  bool showloginPage = true;

  //jump between login & register page
  void togglePages() {
    setState(() {
      showloginPage = !showloginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
