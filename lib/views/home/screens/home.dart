import 'package:flutter/material.dart';
import 'package:kiemtralan2/viewmodels/device_viewmodel.dart';
import '../../../models/device.dart';
import '../components/tabs/device_tabbar_view.dart';
import '../components/tabs/main_tabbar.dart';
import '../components/tabs/room_tabbar_view.dart';
import '../components/widgets/weather.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<Device> devices = [];

  @override
  void initState() {
    checkLogin();
    tabController = TabController(length: 2, vsync: this);

    DeviceViewModel.instance.getDevices().then((value) {
      devices = value;
    });

    super.initState();
  }

  // unnecessary - không cần thiết
  Future<void> checkLogin() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('Test: User is currently signed out!');
      } else {
        print('Test: User is signed in!');
      }
    });

    try {
      if (FirebaseAuth.instance.currentUser == null) {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: "thuycherry14@gmail.com", password: "11111111");
      }
      print("Test: Sign in succses");
    } catch (e) {
      print("Test: Error Sign in");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0, // chỉnh độ cao của appbar
          toolbarHeight: 0,
        ),
        body: Container(
          child: Column(children: [
            if (tabController.index == 0)
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Weather()],
                  )),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              MainTabBar(
                tabController: tabController,
                onTap: () {
                  setState(() {});
                },
              )
            ]),
            const SizedBox(
              height: 17,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  const SingleChildScrollView(
                    child: RoomTabBarView(),
                  ),
                  SingleChildScrollView(
                    child: DiveceTabBarView(
                      devices: devices,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
