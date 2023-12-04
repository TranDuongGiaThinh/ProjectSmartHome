// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:kiemtralan2/main.dart';

// ignore: must_be_immutable
class MainTabBar extends StatefulWidget {
  MainTabBar({super.key, required this.tabController, required this.onTap});
  late TabController tabController;
  final Function() onTap;

  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  final _tabs = ['Phòng', 'Thiết bị'];
  
  @override
  void initState() {
    widget.tabController.addListener(widget.onTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MyApp.screenWidth * 0.75,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 117, 117, 117),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(0.0, 2.0),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: TabBar(
          controller: widget.tabController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 13, 153, 255)),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          tabs: List.generate(
              _tabs.length,
              (index) => Text(
                    _tabs[index],
                    style: const TextStyle(fontSize: 17),
                  )),
        ),
      ),
    );
  }
}
