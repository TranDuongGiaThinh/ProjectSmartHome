import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/Utils/Utils.dart';
import 'package:smart_home/Utils/color_utils.dart';
import 'package:smart_home/views/resuable_widgets/resuable_widgets.dart';

class ForGotPassword extends StatefulWidget {
  const ForGotPassword({super.key});

  @override
  State<ForGotPassword> createState() => _ForGotPasswordState();
}

class _ForGotPasswordState extends State<ForGotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Reset Password",
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
                ElevatedButton(
              onPressed: () async {
                String email = _emailTextController.text;
                try {
                  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                  // Thông báo cho người dùng rằng liên kết đã được gửi
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('A password reset link has been sent to $email'),
                  ));
                } catch (e) {
                  // Xử lý lỗi (ví dụ: email không tồn tại)
                  print('Error: $e');
                }
              },
              child: const Text('Reset Password'),
            ),
                
              ],
            ),
          ))),
    );
  }

  Future resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailTextController.text.trim());
      Utils.showSnackBarTrue('Passwprd Reset Email Sent');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBarFalse(e.message);
      Navigator.of(context).pop();
    }
  }
}
