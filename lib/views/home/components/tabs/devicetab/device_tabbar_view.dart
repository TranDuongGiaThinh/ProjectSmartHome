import 'package:flutter/cupertino.dart';
import '../../../../../data/data.dart';
import '../../devices/device_status.dart';

class DiveceTabBarView extends StatefulWidget {
  const DiveceTabBarView({super.key});

  @override
  State<DiveceTabBarView> createState() => _DiveceTabBarViewState();
}

class _DiveceTabBarViewState extends State<DiveceTabBarView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 2.6),
        itemCount: Data.devices.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
              child: DeviceStatus(deviceId: Data.devices[index].id));
        });
  }
}
