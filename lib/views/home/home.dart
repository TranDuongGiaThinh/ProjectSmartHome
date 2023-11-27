import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../firebase_options.dart';
import 'device_control/device_control.dart';
import 'lite_rolling_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    initFirebase();
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Future<void> initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseAuth.instance.currentUser;
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "thuycherry@gmail.com", password: "11111111");

    FirebaseAuth.instance.currentUser;
    // FirebaseAuth.instance.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0, // chỉnh độ cao của appbar
          toolbarHeight: 0,
        ),
        // backgroundColor: const Color.fromARGB(255, 237, 224, 224),
        body: Container(
          // color: const Color.fromARGB(255, 237, 224, 224),
          child: Column(children: [
            if (tabController.index == 0)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Weather()],
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              MainHomeTabBar(
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
                children: const [
                  SingleChildScrollView(
                    child: RoomTabBarView(),
                  ),
                  SingleChildScrollView(
                    child: DiveceTabView(),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}

class DiveceTabView extends StatefulWidget {
  const DiveceTabView({super.key});

  @override
  State<DiveceTabView> createState() => _DiveceTabViewState();
}

class _DiveceTabViewState extends State<DiveceTabView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        DeviceControl(),
        SizedBox(
          height: 10,
        ),
        DeviceControl(),
        SizedBox(
          height: 10,
        ),
        DeviceControl(),
        SizedBox(
          height: 10,
        ),
        DeviceControl(),
        SizedBox(
          height: 10,
        ),
        DeviceControl(),
        SizedBox(
          height: 10,
        ),
        DeviceControl(),
        SizedBox(
          height: 10,
        ),
        DeviceControl()
      ],
    );
  }
}

class RoomTabBarView extends StatefulWidget {
  const RoomTabBarView({super.key});

  @override
  State<RoomTabBarView> createState() => _RoomTabBarViewState();
}

class _RoomTabBarViewState extends State<RoomTabBarView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: RoomTabBar(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [RoomControl(), RoomControl()],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [RoomControl(), RoomControl()],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [RoomControl(), RoomControl()],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [RoomControl(), RoomControl()],
        ),
      ],
    );
  }
}

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 165, 64, 242),
              Color.fromARGB(255, 231, 85, 238)
            ],
          ),
          borderRadius: BorderRadius.circular(30)),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("22 Feb 2023 /25°C",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                  const Text("Energy Saving",
                      style: TextStyle(fontSize: 23, color: Colors.white)),
                  const Text(
                    "30%",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              const Color.fromARGB(255, 162, 53, 224)
                                  .withOpacity(0.5)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.white, width: 1.0),
                                  borderRadius: BorderRadius.circular(20)))),
                      onPressed: () {},
                      child: const Text("Door is unlockked"))
                ],
              ),
            ),
          ),
          Expanded(child: Image.asset('assets/home/weather.png'))
        ],
      ),
    );
  }
}

class MainHomeTabBar extends StatefulWidget {
  MainHomeTabBar({super.key, required this.tabController, required this.onTap});
  late TabController tabController;
  final Function() onTap;

  @override
  State<MainHomeTabBar> createState() => _MainHomeTabBarState();
}

class _MainHomeTabBarState extends State<MainHomeTabBar> {
  final _tabs = [
    const Text(
      'Phòng',
      style: TextStyle(fontSize: 17),
    ),
    const Text(
      'Thiết bị',
      style: TextStyle(fontSize: 17),
    ),
  ];
  @override
  void initState() {
    // widget.tabController = TabController(length: 2, vsync: this);
    widget.tabController.addListener(widget.onTap);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 117, 117, 117),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: TabBar(
          controller: widget.tabController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 13, 153, 255)),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          tabs: _tabs,
        ),
      ),
    );
  }
}

class RoomTabBar extends StatefulWidget {
  const RoomTabBar({super.key});

  @override
  State<RoomTabBar> createState() => _RoomTabBarState();
}

class _RoomTabBarState extends State<RoomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tabs = [
    const Text(
      'Phòng ngủ',
      style: TextStyle(fontSize: 15),
    ),
    const Text(
      'Phòng khách',
      style: TextStyle(fontSize: 15),
    ),
    const Text(
      'Phòng bếp',
      style: TextStyle(fontSize: 15),
    ),
    const Text(
      'Phòng thờ',
      style: TextStyle(fontSize: 15),
    ),
  ];
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: TabBar(
        isScrollable: true,
        controller: _tabController,
        tabs: _tabs,
        labelColor: const Color.fromARGB(255, 82, 80, 80),
        indicatorColor: const Color.fromARGB(255, 82, 80, 80),
        unselectedLabelColor: const Color.fromARGB(255, 191, 188, 188),
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }
}

class DeviceControl extends StatefulWidget {
  const DeviceControl({super.key});

  @override
  State<DeviceControl> createState() => _DeviceControlState();
}

class _DeviceControlState extends State<DeviceControl> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DeviceControlScreen()));
      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.35,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            border: Border.all(
                width: 3, color: const Color.fromARGB(255, 208, 208, 208)),
            color: const Color.fromARGB(255, 230, 230, 230),
            borderRadius: BorderRadius.circular(40)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 75,
            width: 75,
            child: Image.asset('assets/home/light.png'),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.06),
                  child: Row(children: const [
                    Text('9.9Kwh',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Row(
                    children: const [
                      Text('Đèn',
                          style: TextStyle(
                              color: Color.fromARGB(255, 141, 141, 141),
                              fontSize: 25))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                const Text('Phòng ngủ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 141, 141, 141),
                        fontSize: 18)),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                LiteRollingSwitch(
                  width: 90,
                  value: false,
                  textOn: 'bật',
                  textOff: 'tắt',
                  colorOn: const Color.fromRGBO(56, 142, 60, 1),
                  colorOff: const Color.fromRGBO(213, 0, 0, 1),
                  iconOn: Icons.done,
                  iconOff: Icons.remove_circle_outline,
                  textSize: 16.0,
                  onChanged: (bool state) {},
                  onSwipe: () {},
                  onDoubleTap: () {},
                  onTap: () {},
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class RoomControl extends StatefulWidget {
  const RoomControl({super.key});

  @override
  State<RoomControl> createState() => _RoomControlState();
}

class _RoomControlState extends State<RoomControl> {
  final redDot = 'assets/home/redDot.png';
  final greenDot = 'assets/home/greenDot.png';
  var state = '';
  var state_Str = '';

  @override
  void initState() {
    state = redDot;
    state_Str = 'tắt';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DeviceControlScreen(),
          ),
        )
      },
      child: Container(
        width: 190,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 208, 208, 208), width: 3),
          color: const Color.fromARGB(255, 230, 230, 230),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 7, right: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset('assets/home/light.png'),
                  ),
                  GestureDetector(
                    onTap: () => {
                      setState(() => {
                            if (state == redDot)
                              {state = greenDot, state_Str = 'bật'}
                            else
                              {state = redDot, state_Str = 'tắt'}
                          })
                    },
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.asset('assets/home/onoff.png'),
                    ),
                  )
                ],
              ),
            ),
            const Text('Đèn',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 115, 115, 115))),
            Padding(
              padding: const EdgeInsets.only(right: 18, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 13,
                    height: 13,
                    child: Image.asset(state),
                  ),
                  Text(
                    '  Đang $state_Str',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 186, 186, 186)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
