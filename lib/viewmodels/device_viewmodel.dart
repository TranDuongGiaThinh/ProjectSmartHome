import 'package:firebase_database/firebase_database.dart';
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
    List<Device> devices = [];

    try {
      final data = await FirebaseDatabase.instance.ref("device/").get();

      final Map<String, dynamic> map = data.value as Map<String, dynamic>;

      map.forEach((key, value) {
        devices.add(Device(
            name: value["name"],
            board: board,
            wattage: wattage,
            id: value["id"],
            roomID: value["room_id"],
            pin: value["board"]["pin"],
            state: value["status"]));
        // devices
        //     .add(Device(
        //       pin: key.toString(),
        //        state: value == 0 ? false : true,
        //        name:
        //        ));
      });
    } catch (e) {
      print("Error get data: ${e.toString()}");
    }

    return devices;
  }

  Future<void> setStatus(Device device) async {
    final data =
        await FirebaseDatabase.instance.ref("board1/outputs/digital/").get();

    final Map<dynamic, dynamic> map = data.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      if (key == device.pin.toString()) {
        if (value != device.state) {
          FirebaseDatabase.instance
              .ref("board1/outputs/digital/")
              .update({device.pin: device.state ? 1 : 0});
          return;
        }
      }
    });
  }
}
