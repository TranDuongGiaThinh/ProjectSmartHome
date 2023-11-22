import 'package:flutter/material.dart';
import 'package:smart_home/presenters/user_presenter.dart';
import 'package:smart_home/views/color_utils.dart';
import 'package:smart_home/views/index_screen.dart';
import 'package:smart_home/views/resuable_widgets/resuable_widgets.dart';

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
  initState()
  {
    super.initState();
    UserPresenter.getUserById("1").then((value){
      setState(() {
        
      });
    });
  }
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
                SizedBox(
                  height: 100,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.light_mode_outlined,color: Colors.white,size: 100,)
                    ],
                  ),
                ),
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
               // signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
