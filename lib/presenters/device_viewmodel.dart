import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_home/presenters/room_viewmodel.dart';
import '../data/data.dart';
import '../models/device.dart';

class DeviceViewModel {
  static DeviceViewModel? _instance;

  DeviceViewModel._();

// design pattern singleton
  static DeviceViewModel get instance {
    _instance ??= DeviceViewModel._();
    return _instance!;
  }

  Future<List<Device>> getDevices() async {
    if (Data.devices.isNotEmpty) return Data.devices;

    List<Device> devices = [];

    try {
      final data = await FirebaseDatabase.instance.ref("device/").get();

      final Map<dynamic, dynamic> map = data.value as Map<dynamic, dynamic>;

      map.forEach((key, value) {
        devices.add(Device(
            id: key,
            name: value["name"],
            image: value["image"],
            board: value["board"]["id"],
            wattage: value["wattage"],
            roomName: RoomViewModel.instance.getNameByID(value["room_id"]),
            roomID: value["room_id"],
            pin: value["board"]["pin"],
            state: value["status"]));
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error get data: ${e.toString()}");
      }
    }
    return devices;
  }

  String getRef(Device device) {
    return "board/${device.board}/outputs/digital/${device.pin}/";
  }

  Device getDeviceById(String id) {
    Device device = Data.devices.where((element) => element.id == id).first;
    return device;
  }

  Future<void> setStatus(Device device) async {
    final deviceDataPath = "device/${device.id}/";
    final boardDataPath = "board/${device.board}/outputs/digital/";

    FirebaseDatabase.instance
        .ref(deviceDataPath)
        .update({"status": device.state});

    FirebaseDatabase.instance
        .ref(boardDataPath)
        .update({device.pin: device.state});
  }
}
