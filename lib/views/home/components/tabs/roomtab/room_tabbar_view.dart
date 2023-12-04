import 'package:flutter/material.dart';
import 'package:kiemtralan2/views/home/components/tabs/roomtab/room_tabbar.dart';
import '../../../../../data/data.dart';
import 'devicetab/device_tabbarview.dart';

class RoomTabBarView extends StatefulWidget {
  const RoomTabBarView({super.key});

  @override
  State<RoomTabBarView> createState() => _RoomTabBarViewState();
}

class _RoomTabBarViewState extends State<RoomTabBarView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: Data.rooms.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: RoomTabBar(
            tabController: _tabController,
            onTap: () {
              setState(() {});
            },
          ),
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: List.generate(
            Data.rooms.length,
            (index) => DeviceInRoomTabBarView(roomId: Data.rooms[index].id),
          ),
        ))
      ],
    );
  }
}
