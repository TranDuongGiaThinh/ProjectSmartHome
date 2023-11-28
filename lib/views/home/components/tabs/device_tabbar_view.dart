
import 'package:flutter/cupertino.dart';

import '../../../../models/device.dart';
import '../devices/device_status.dart';

class DiveceTabBarView extends StatefulWidget {
  const DiveceTabBarView({super.key, required this.devices});
  final List<Device> devices;

  @override
  State<DiveceTabBarView> createState() => _DiveceTabBarViewState();
}

class _DiveceTabBarViewState extends State<DiveceTabBarView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          widget.devices.length,
          (index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: DeviceStatus(
                device: widget.devices[index],
              ))),
    );
  }
}
