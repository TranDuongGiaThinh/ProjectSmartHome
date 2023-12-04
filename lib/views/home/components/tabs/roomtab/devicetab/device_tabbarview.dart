import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../../data/data.dart';
import '../../../../../../models/device.dart';
import '../../../devices/device_status_room.dart';

class DeviceInRoomTabBarView extends StatefulWidget {
  const DeviceInRoomTabBarView({super.key, required this.roomId});
  final String roomId;

  @override
  State<DeviceInRoomTabBarView> createState() => _DeviceInRoomTabBarViewState();
}

class _DeviceInRoomTabBarViewState extends State<DeviceInRoomTabBarView> {
  final List<Device> devices = [];

  @override
  void initState() {
    for (var element in Data.devices) {
      if (element.roomID == widget.roomId) {
        devices.add(element);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Số cột trong mỗi hàng
        crossAxisSpacing: 0, // Khoảng cách giữa các cột
        childAspectRatio: 10 / 9.5,
        mainAxisSpacing: 8.0, // Khoảng cách giữa các hàn
      ),
      itemCount: devices.length, // Số lượng
      itemBuilder: (context, index) {
        // Thay thế widget này bằng widget hiển thị thông tin sản phẩm
        return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: DeviceStautsRoom(
              deviceId: devices[index].id,
            ));
      },
    );
  }
}
