import 'package:addapp/components/my_button.dart';
import 'package:addapp/components/my_textfield.dart';
import 'package:addapp/components/square_tile.dart';
import 'package:addapp/pages/forgot_pass.dart';
import 'package:addapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signuserin() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
            ),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMassge(e.code);
    }
  }

//error massge
  void showErrorMassge(String massage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 132, 139, 143),
          title: Center(
              child: Text(
            massage,
            style: const TextStyle(color: Color.fromARGB(207, 0, 0, 0)),
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Image.asset(
                  'lib/images/adds.png',
                  height: 150,
                ),
                const SizedBox(
                  height: 15,
                ),
                //welcome text
                Text(
                  "Bring it on !",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                //Subtitle
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Premium quality sneakers and custom kicks",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 99, 103, 105),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //username
                MyTextfield(
                  controller: emailController,
                  hinText: 'Email',
                  obsecureText: false,
                ),

                const SizedBox(
                  height: 20,
                ),
                //password
                MyTextfield(
                  controller: passwordController,
                  hinText: 'Password',
                  obsecureText: true,
                ),
                //forgot passsword
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                //sign in button

                MyButton(
                  text: "Sign in",
                  onTap: signuserin,
                ),

                const SizedBox(
                  height: 20,
                ),
                //google/apple button
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Text("or continue with"),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SquareTile(
                    ontap: () => AuthService().signInWithGoogle(),
                    Imagepath: 'lib/images/google.png',
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  SquareTile(
                    ontap: () {},
                    Imagepath: 'lib/images/apple.png',
                  ),
                ]),
                SizedBox(
                  height: 20,
                ),
                //not a member?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a Memeber?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register now",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
