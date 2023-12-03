import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/Utils/color_utils.dart';
import 'package:smart_home/models/user.dart';
import 'package:smart_home/views/resuable_widgets/resuable_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _fullnNameTextController =
      TextEditingController();
  late final TextEditingController _phoneTextController =
      TextEditingController();
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
              padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    resuableTextFile(
                      'Enter Email',
                      Icons.email,
                      false, // Không phải là mật khẩu
                      false, // Không phải là số điện thoại
                      _emailTextController,
                      (value) {
                        if (value != null && !EmailValidator.validate(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    resuableTextFile(
                      "Enter FullName",
                      Icons.person_rounded,
                      false,
                      false,
                      _fullnNameTextController,
                      (value) {
                        if (value == null || value.isEmpty) {
                          return 'Full name is required';
                        }
                        return null; // Valid
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    resuableTextFile(
                      'Enter Name',
                      Icons.person,
                      false, // Không phải là mật khẩu
                      false, // Không phải là số điện thoại
                      _userNameTextController,
                      (value) {
                        if (value == null || value.isEmpty) {
                          return ' Name is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    resuableTextFile(
                      'Enter Password',
                      Icons.lock,
                      true, // Đây là mật khẩu
                      false, // Không phải là số điện thoại
                      _passwordTextController,
                      (value) {
                        if (value != null && value.isNotEmpty) {
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    resuableTextFile(
                      'Enter Phone',
                      Icons.phone,
                      false, // Không phải là mật khẩu
                      true, // Đây là số điện thoại
                      _phoneTextController,
                      (value) {
                        if (value != null && value.isNotEmpty) {
                          if (value.length != 10) {
                            return 'Phone number must be 10 digits';
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
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
                    firebaseUIButton(context, "Sign Ups", () {
                      final isVail = _formKey.currentState!.validate();
                      if (!isVail) return;
                      final newUser =UserModel.info(
                        blocked: false,
                        email: _emailTextController.text,
                        fullName: _fullnNameTextController.text,
                        userName: _userNameTextController.text,
                        image:null,
                        isHost: false,
                        phoneNumber: _phoneTextController.text,
                        permissions:[
                          isLivingRoomSelected,
                          isKitChenSelected,
                          isBedRoomSelected,
                          isToiletSelected,
                        ] 
                        
                      );
                      signUp(context, newUser, _passwordTextController.text);
                    })
                  ],
                ),
              ))),
    );
  }
}
