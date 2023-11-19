import 'package:flutter/material.dart';
import 'package:smart_home/view/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Logout"),
          onPressed: () {
            // FirebaseAuth.instance.signOut().then((value) {
            //   print("Signed Out");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignIn()));
           // }
           // );
          },
        ),
      ),
    );
  }
}