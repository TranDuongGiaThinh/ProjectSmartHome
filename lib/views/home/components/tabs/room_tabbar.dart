
import 'package:flutter/material.dart';

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