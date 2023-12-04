import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

import '../data/data.dart';
import '../models/room.dart';

class RoomViewModel {
  static RoomViewModel? _instance;

  RoomViewModel._();

// design pattern singleton
  static RoomViewModel get instance {
    _instance ??= RoomViewModel._();
    return _instance!;
  }

  Future<List<Room>> getRooms() async {
    if (Data.rooms.isNotEmpty) return Data.rooms;
    
    List<Room> rooms = [];

    try {
      final data = await FirebaseDatabase.instance.ref("room/").get();

      final Map<dynamic, dynamic> map = data.value as Map<dynamic, dynamic>;

      map.forEach((key, value) {
        rooms.add(Room(key, value));
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error get data: ${e.toString()}");
      }
    }

    return rooms;
  }

  String getNameByID(String id) {
    Room roomById = Data.rooms.firstWhere((room) => room.id == id);
    return roomById.name;
  }
}
