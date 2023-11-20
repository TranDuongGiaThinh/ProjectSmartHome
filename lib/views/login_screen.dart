import 'package:flutter/material.dart';
import 'package:smart_home/views/resuable_widgets.dart';
import 'package:smart_home/views/color_utils.dart';
import 'package:smart_home/views/index_screen.dart';
import 'package:smart_home/views/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.reloadThemeMode});
  final Function reloadThemeMode;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextController=TextEditingController();
    final TextEditingController _passwordTextController=TextEditingController();

   @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToCoLor("CB2B93"),
          hexStringToCoLor("9546C4"),
          hexStringToCoLor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
              //  logoWidget("assets/images/logo1.png"),
                const SizedBox(
                  height: 30,
                ),
                resuableTextFile("Enter UserName", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextFile("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
              //  forgetPassword(context),
                firebaseUIButton(context, "Sign In", () {
                  // FirebaseAuth.instance
                  //     .signInWithEmailAndPassword(
                  //         email: _emailTextController.text,
                  //         password: _passwordTextController.text)
                  //     .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  IndexScreen(reloadThemeMode: widget.reloadThemeMode)));
                //   }).onError((error, stackTrace) {
                //     print("Error ${error.toString()}");
                //   });
                 }
                ),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
  // Widget forgetPassword(BuildContext context) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     height: 35,
  //     alignment: Alignment.bottomRight,
  //     child: TextButton(
  //       child: const Text(
  //         "Forgot Password?",
  //         style: TextStyle(color: Colors.white70),
  //         textAlign: TextAlign.right,
  //       ),
  //       onPressed: () => Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => const ResetPassword())),
  //     ),
  //   );
  // }
}
