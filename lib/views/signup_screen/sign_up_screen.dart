import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/Utils/color_utils.dart';
import 'package:smart_home/models/user.dart';
import 'package:smart_home/presenters/language_presenter.dart';
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
        title: Text(
          LanguagePresenter.language.singUp,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                      "${LanguagePresenter.language.enter} ${LanguagePresenter.language.email}",
                      Icons.email,
                      false, // Không phải là mật khẩu
                      false, // Không phải là số điện thoại
                      _emailTextController,
                      (value) {
                        if (value != null && !EmailValidator.validate(value)) {
                          return LanguagePresenter.language.enterEmailValid;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    resuableTextFile(
                      "${LanguagePresenter.language.enter} ${LanguagePresenter.language.fullName}",
                      Icons.person_rounded,
                      false,
                      false,
                      _fullnNameTextController,
                      (value) {
                        if (value == null || value.isEmpty) {
                          return "${LanguagePresenter.language.fullName} ${LanguagePresenter.language.notBeEmpty}";
                        }
                        return null; // Valid
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    resuableTextFile(
                      "${LanguagePresenter.language.enter} ${LanguagePresenter.language.userName}",
                      Icons.person,
                      false, // Không phải là mật khẩu
                      false, // Không phải là số điện thoại
                      _userNameTextController,
                      (value) {
                        if (value == null || value.isEmpty) {
                          return "${LanguagePresenter.language.userName} ${LanguagePresenter.language.notBeEmpty}";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    resuableTextFile(
                      "${LanguagePresenter.language.enter} ${LanguagePresenter.language.password}",
                      Icons.lock,
                      true, // Đây là mật khẩu
                      false, // Không phải là số điện thoại
                      _passwordTextController,
                      (value) {
                        if (value != null && value.isNotEmpty) {
                          if (value.length < 8) {
                            return LanguagePresenter.language.passwordValid;
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    resuableTextFile(
                      "${LanguagePresenter.language.enter} ${LanguagePresenter.language.phoneNumber}",
                      Icons.phone,
                      false, // Không phải là mật khẩu
                      true, // Đây là số điện thoại
                      _phoneTextController,
                      (value) {
                        if (value != null && value.isNotEmpty) {
                          if (value.length != 10) {
                            return LanguagePresenter.language.passwordValid;
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
                          resualRow(LanguagePresenter.language.livingRoom, isLivingRoomSelected, () {
                            setState(() {
                              isLivingRoomSelected = !isLivingRoomSelected;
                            });
                          }),
                          resualRow(LanguagePresenter.language.kitchen, isKitChenSelected, () {
                            setState(() {
                              isKitChenSelected = !isKitChenSelected;
                            });
                          }),
                          resualRow(LanguagePresenter.language.bedRoom, isBedRoomSelected, () {
                            setState(() {
                              isBedRoomSelected = !isBedRoomSelected;
                            });
                          }),
                          resualRow(LanguagePresenter.language.toilet, isToiletSelected, () {
                            setState(() {
                              isToiletSelected = !isToiletSelected;
                            });
                          })
                        ],
                      ),
                    ),
                    firebaseUIButton(context, LanguagePresenter.language.singUp, () {
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
