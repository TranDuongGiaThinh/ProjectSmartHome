import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kiemtralan2/main.dart';
import '../components/tabs/devicetab/device_tabbar_view.dart';
import '../components/tabs/main_tabbar.dart';
import '../components/tabs/roomtab/room_tabbar_view.dart';
import '../components/widgets/weather.dart';
import 'package:firebase_auth/firebase_auth.dart';

const tabLenght = 2;
const tabViewRoom = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //test
    checkLogin();

    tabController = TabController(length: tabLenght, vsync: this);
    super.initState();
  }

  // unnecessary - không cần thiết
  Future<void> checkLogin() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        if (kDebugMode) {
          print('Test: User is currently signed out!');
        }
      } else {
        if (kDebugMode) {
          print('Test: User is signed in!');
        }
      }
    });

    try {
      FirebaseDatabase.instance.setPersistenceEnabled(true);
      if (FirebaseAuth.instance.currentUser == null) {
        // ignore: unused_local_variable
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: "thuycherry14@gmail.com", password: "11111111");
      }
      if (kDebugMode) {
        print("Test: Sign in succses");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Test: Error Sign in");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    MyApp.screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0, // chỉnh độ cao của appbar
          toolbarHeight: 0,
        ),
        // ignore: avoid_unnecessary_containers
        body: AnimatedBuilder(
          animation: tabController,
          builder: (context, child) {
            return Transform.translate(
                offset: Offset(MyApp.screenWidth * tabController.offset, 0),
                child: Column(children: [
                  if (tabController.index == tabViewRoom)
                    const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Center(
                          child: Weather(),
                        )),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MainTabBar(
                      tabController: tabController,
                      onTap: () {
                        setState(() {});
                      },
                    ),
                  )),
                  const SizedBox(
                    height: 17,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        RoomTabBarView(),
                        DiveceTabBarView(),
                      ],
                    ),
                  ),
                ]));
          },
        ));
  }
}
