import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/Utils/color_utils.dart';
import 'package:smart_home/models/user.dart';
import 'package:smart_home/presenters/language_presenter.dart';
import 'package:smart_home/views/forgot_password/forgot_password.dart';
import 'package:smart_home/views/resuable_widgets/resuable_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });
  // final Function reloadThemeMode;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  
  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Nếu đã đăng nhập, chuyển hướng đến trang chủ
      Navigator.pushReplacementNamed(context, "/");
    }
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
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.light_mode_outlined,
                        color: Colors.white,
                        size: 100,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
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
                firebaseUIButton(context, "Sign In", () async {
                  final isVail = _formKey.currentState!.validate();
                  if (!isVail) return;
                  signIn(context, _emailTextController.text,
                      _passwordTextController.text);
                }
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Text(
                    LanguagePresenter.language.forgotPassword,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize:20
                    ),
                  ),
                  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ForGotPassword()))
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
