import 'package:flutter/cupertino.dart';
import '../../screens/home.dart';
import '../devices/device_status_room.dart';
import '../room_tabbar.dart';

class RoomTabBarView extends StatefulWidget {
  const RoomTabBarView({super.key});
  // final List<Device> devices;

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
        // ...List.generate(widget.devices.length, (index) => Text("sdfsd")),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [DeviceStautsRoom(), DeviceStautsRoom()],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [DeviceStautsRoom(), DeviceStautsRoom()],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [DeviceStautsRoom(), DeviceStautsRoom()],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [DeviceStautsRoom(), DeviceStautsRoom()],
        ),
      ],
    );
  }
}
