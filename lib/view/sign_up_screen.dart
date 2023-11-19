import 'package:flutter/material.dart';
import 'package:smart_home/resualble_widgets/resualble_widget.dart';
import 'package:smart_home/utils/color_utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _fullnNameTextController =
      TextEditingController();
  final TextEditingController _PhoneTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isLivingRoomSelected = false;
    bool isKitChenSelected = false;
    bool isBedRoomSelected = false;
    bool isToiletSelected = false;
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
                resuableTextFile("Enter Email Id", Icons.person_outline, false,
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
                    _PhoneTextController),
                const SizedBox(
                  height: 20,
                ),
                Column(children: [
                  reusableCheckboxListTile("Living Room", isLivingRoomSelected, (bool? newValue) {
                setState(() {
              isLivingRoomSelected=newValue??false;
                });
               }),
                  reusableCheckboxListTile("Kitchen", isKitChenSelected, (bool? newValue) {
                setState(() {
              isLivingRoomSelected=newValue??false;
                });
               }),
                  reusableCheckboxListTile("Bedroom", isBedRoomSelected, (bool? newValue) {
                setState(() {
              isLivingRoomSelected=newValue??false;
                });
               }),
                  reusableCheckboxListTile("Bathroom", isToiletSelected, (bool? newValue) {
                setState(() {
              isLivingRoomSelected=newValue??false;
                });
               }),
               
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
