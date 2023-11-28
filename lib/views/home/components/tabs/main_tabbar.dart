
// ignore: must_be_immutable
import 'package:flutter/material.dart';

class MainTabBar extends StatefulWidget {
  MainTabBar({super.key, required this.tabController, required this.onTap});
  late TabController tabController;
  final Function() onTap;

  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
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
