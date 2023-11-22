import 'package:flutter/material.dart';
import 'package:smart_home/views/color_utils.dart';
import 'package:smart_home/views/resuable_widgets/resuable_widgets.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _fullnNameTextController =
      TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  bool isLivingRoomSelected = false;
  bool isKitChenSelected = false;
  bool isBedRoomSelected = false;
  bool isToiletSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                resuableTextFile("Enter Emai", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextFile("Enter FullName", Icons.person_outline, false,
                    _fullnNameTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextFile("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextFile("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextFile("Enter Phone", Icons.lock_outlined, true,
                    _phoneTextController),
                const SizedBox(
                  height: 20,
                ),
                Column(children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        resualRow("LivingRoom", isLivingRoomSelected, () {
                          setState(() {
                            isLivingRoomSelected = !isLivingRoomSelected;
                          });
                        }),
                        resualRow("Kitchen", isKitChenSelected, () {
                          setState(() {
                            isKitChenSelected = !isKitChenSelected;
                          });
                        }),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        resualRow("BedRoom", isBedRoomSelected, () {
                          setState(() {
                            isBedRoomSelected = !isBedRoomSelected;
                          });
                        }),
                        resualRow("Toilet", isToiletSelected, () {
                          setState(() {
                            isToiletSelected = !isToiletSelected;
                          });
                        })
                      ],
                    ),
                  ),
                ]),
                firebaseUIButton(context, "Sign Up", () {
                  // FirebaseAuth.instance
                  //     .createUserWithEmailAndPassword(
                  //         email: _emailTextController.text,
                  //         password: _passwordTextController.text)
                  //     .then((value) {
                  //   print("Created New Account");
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => const HomeScreen()));
                  // }).onError((error, stackTrace) {
                  //   print("Error ${error.toString()}");
                  // });
                })
              ],
            ),
          ))),
    );
  }
}

//a
