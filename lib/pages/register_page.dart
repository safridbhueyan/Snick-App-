import 'package:addapp/components/my_button.dart';
import 'package:addapp/components/my_textfield.dart';
import 'package:addapp/components/square_tile.dart';
import 'package:addapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpasswordController = TextEditingController();

  void signuserUp() async {
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
    // try create
    try {
      if (passwordController.text == confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        //show error if password and confirm password aint same
        showErrorMassge("Password dont match!");
      }
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
                  'lib/images/nike.png',
                  height: 130,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                //welcome text
                Text(
                  "Just Do It!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                //Subtitle
                SizedBox(
                  height: 10,
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
                  height: 15,
                ),
                //password
                MyTextfield(
                  controller: passwordController,
                  hinText: 'Password',
                  obsecureText: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                //password
                MyTextfield(
                  controller: confirmpasswordController,
                  hinText: 'Confirm Password',
                  obsecureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                //sign in button

                MyButton(
                  text: "Sign up",
                  onTap: signuserUp,
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
                      "Already have account?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login now !",
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
