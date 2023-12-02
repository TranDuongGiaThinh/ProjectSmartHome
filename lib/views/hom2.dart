import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/views/signup_screen/sign_up_screen.dart';

class Homme2 extends StatefulWidget {
 const Homme2({Key? key}) : super(key: key);

  @override
  State<Homme2> createState() => _Homme2State();
}

class _Homme2State extends State<Homme2> {
 Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    getDataByUserId();
  }

  
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Homes"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Text(
              'Sign In as',
              style: TextStyle(fontSize: 26),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              currentUser?.email ?? 'No email available',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),

             const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User ID: ${userData['id']}'),
                Text('Full Name: ${userData['fullname']}'),
                Text('Living Room: ${userData['LivingRoom']}'),
                Text('Kitchen: ${userData['Kitchen']}'),
                Text('Bed Room: ${userData['BedRoom']}'),
                Text('Toilet: ${userData['Toilet']}'),
                // ... và các trường khác
              ],
            ),

            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              icon: const Icon(
                Icons.arrow_back,
                size: 24,
              ),
              label: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
              },
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              icon: const Icon(
                Icons.arrow_back,
                size: 24,
              ),
              label: const Text(
                'Logout',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () => FirebaseAuth.instance.signOut(),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> getDataByUserId() async {
  try {
    // Lấy người dùng hiện tại đang đăng nhập từ Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Lấy "ảnh chụp" của dữ liệu từ Firestore cho tài liệu của người dùng hiện tại
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      // Kiểm tra xem tài liệu có tồn tại không
       if (userDoc.exists) {
          setState(() {
            userData = userDoc.data() as Map<String, dynamic>;
          });
        } else {
          print('Tài liệu không tồn tại trong Firestore.');
          setState(() {
            userData = {};
          });
        }
      }
    } catch (e) {
      print('Lỗi khi lấy dữ liệu từ Firestore: $e');
      setState(() {
        userData = {};
      });
    }
  }


}
