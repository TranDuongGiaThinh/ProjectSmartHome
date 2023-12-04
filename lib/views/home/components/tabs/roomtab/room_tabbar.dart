import 'package:flutter/material.dart';
import '../../../../../data/data.dart';

// ignore: must_be_immutable
class RoomTabBar extends StatefulWidget {
  RoomTabBar({super.key, required this.tabController, required this.onTap});

  late TabController tabController;
  final Function() onTap;

  @override
  State<RoomTabBar> createState() => _RoomTabBarState();
}

class _RoomTabBarState extends State<RoomTabBar> {
  final _tabs = List.generate(
      Data.rooms.length,
      (index) =>
          Text(Data.rooms[index].name, style: const TextStyle(fontSize: 15)));

  @override
  void initState() {
    widget.tabController.addListener(widget.onTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: TabBar(
          isScrollable: true,
          controller: widget.tabController,
          tabs: _tabs,
          labelColor: const Color.fromARGB(255, 82, 80, 80),
          indicatorColor: const Color.fromARGB(255, 197, 59, 210),
          unselectedLabelColor: const Color.fromARGB(255, 191, 188, 188),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 3.5,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 25),
        ));
  }
}
