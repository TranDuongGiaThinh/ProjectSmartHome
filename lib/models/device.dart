
class Device {
  final String id;
  final String name;

  final String board;
  final String pin;
  late bool state;

  final double wattage;

  final String roomID;

  Device(
      {required this.name,
      required this.board,
      required this.wattage,
      required this.id,
      required this.roomID,
      required this.pin,
      required this.state});
}
