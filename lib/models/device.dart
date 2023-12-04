class Device {
  final String id;
  final String name;

  final String board;
  final String pin;
  late int state;
  final String image;

  final double wattage;

  final String roomID;
  final String roomName;

  Device(
      {required this.name,
      required this.image,
      required this.board,
      required this.wattage,
      required this.id,
      required this.roomID,
      required this.roomName,
      required this.pin,
      required this.state});
}
