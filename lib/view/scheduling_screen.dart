import 'package:flutter/material.dart';
import 'package:smart_home/model/language.dart';
import 'package:smart_home/presenter/language_presenter.dart';

class SchedulingScreen extends StatefulWidget {
  const SchedulingScreen({Key? key}) : super(key: key);

  @override
  _SchedulingScreenState createState() => _SchedulingScreenState();
}

class FunctionDevice{
  final int id;
  final String name;
  final String description;
  FunctionDevice({required this.id,required this.name,required this.description});
}

class Device {
  final int id;
  final String name;
  final String description;
  final List<FunctionDevice>fundevices;
  Device({required this.id, required this.name, required this.description,required this.fundevices});
}

class Room {
  final int id;
  final String name;
  final String description;
  final List<Device> devices;

  Room({required this.id, required this.name, required this.description, required this.devices});
}

class _SchedulingScreenState extends State<SchedulingScreen> {
  late DateTime selectedDate;
  TimeOfDay selectedTime = TimeOfDay.now();
  int? selectedRoomId; // Sử dụng kiểu int? để đối mặt với trường hợp người dùng chưa chọn phòng
  int? selectedDeviceId;
  int? selectedFunDeviceId;
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  void initStates() {
    super.initState();
    selectedDate = DateTime.now();
    selectedFunDeviceId = null; // Khởi tạo selectedFunDeviceId
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  final List<Room> roomList = [
    Room(
      id: 0,
      name: 'Phòng vệ sinh',
      description: 'Xử lí nỗi buồn',
      devices: [
        Device(id: 0, name: 'đèn', description: 'Chiếu sáng,v.v',fundevices: [
          FunctionDevice(id: 0, name: 'Nháy nháy', description: 'Sập sình'),
          FunctionDevice(id: 1, name: 'Bật', description: 'Bật thiết bị'),
          FunctionDevice(id: 2, name: 'tắt', description: 'tắt thiết bị')
        ]),
        Device(id: 1, name: 'quạt', description: 'sảng khoái ngày hè',fundevices: [
          FunctionDevice(id: 0, name: 'Bật', description: 'Bật thiết bị'),
          FunctionDevice(id: 1, name: 'tắt', description: 'tắt thiết bị')
        ]),
      ],
    ),
    Room(
      id: 1,
      name: 'Phòng ngủ',
      description: 'Nơi nghỉ ngơi khi mệt',
      devices: [
        Device(id: 0, name: 'đèn', description: 'Chiếu sáng,v.v',fundevices: [
          FunctionDevice(id: 0, name: 'Nháy nháy', description: 'Sập sình'),
          FunctionDevice(id: 1, name: 'Bật', description: 'Bật thiết bị'),
          FunctionDevice(id: 2, name: 'tắt', description: 'tắt thiết bị')
        ]),
        Device(id: 1, name: 'quạt', description: 'sảng khoái ngày hè',fundevices: [
          FunctionDevice(id: 0, name: 'Bật', description: 'Bật thiết bị'),
          FunctionDevice(id: 1, name: 'tắt', description: 'tắt thiết bị')
        ]),
      ],
    ),
  ];

  final List<Device> deviceList = [
    Device(
      id: 0,
      name: 'Đèn',
      description: 'Chiếu sáng, v.v',
      fundevices: [
        FunctionDevice(id: 0, name: 'Nháy nháy', description: 'Sập sình'),
        FunctionDevice(id: 1, name: 'Bật', description: 'Bật thiết bị'),
        FunctionDevice(id: 2, name: 'Tắt', description: 'Tắt thiết bị'),
      ],
    ),
    Device(
      id: 1,
      name: 'Quạt',
      description: 'Sảng khoái ngày hè',
      fundevices: [
        FunctionDevice(id: 0, name: 'Bật', description: 'Bật thiết bị'),
        FunctionDevice(id: 1, name: 'Tắt', description: 'Tắt thiết bị'),
      ],
    ),
  ];

  Future<int?> _selectedLocation(BuildContext context) async {
    final int? picked = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text("Chọn phòng"),
            content: Container(
              width: double.maxFinite, // Đảm bảo container chiếm đầy đủ chiều rộng
              height: 300, // Đặt chiều cao cố định hoặc điều chỉnh theo cần thiết
              child: ListView.builder(
                itemCount: roomList.length,
                itemBuilder: (BuildContext context, int index) {
                  Room room = roomList[index];
                  return ListTile(
                    title: Text(room.name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    onTap: () {
                      Navigator.of(context).pop(room.id);
                    },
                  );
                },
              ),
            ),
          );
      },
    );
    return picked;
  }

  Future<int?> _selectDevice(BuildContext context, Room room) async {
    final int? picked = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Chọn thiết bị"),
          content: Container(
            width: double.maxFinite,
            height: 300,
            child: ListView.builder(
              itemCount: room.devices.length,
              itemBuilder: (BuildContext context, int index) {
                Device device = room.devices[index];
                return ListTile(
                  title: Text(device.name, style: TextStyle(fontSize: 20)),
                  onTap: () {
                    Navigator.of(context).pop(device.id);
                  },
                );
              },
            ),
          ),
        );
      },
    );
    return picked;
  }

  Future<int?> _selectFunction(BuildContext context, Device device) async {
    final int? picked = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Chọn chức năng cho ${device.name}"),
          content: Container(
            width: double.maxFinite,
            height: 200,
            child: ListView.builder(
              itemCount: device.fundevices.length,
              itemBuilder: (BuildContext context, int index) {
                FunctionDevice function = device.fundevices[index];
                return ListTile(
                  title: Text(function.name, style: TextStyle(fontSize: 20)),
                  onTap: () {
                    Navigator.of(context).pop(function.id);
                  },
                );
              },
            ),
          ),
        );
      },
    );
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    String dateString = 'Chưa chọn ngày';
    if (selectedDate != null) {
      dateString = '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
    }

    return 
    Scaffold(
      body: SingleChildScrollView(child: 
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 151, 71, 255),
                ),
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.date_range_outlined, size: 50),
                    Text('$dateString', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectTime(context),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 151, 71, 255),
                ),
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.access_time_outlined, size: 50),
                    Text(' ${selectedTime.format(context)}', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
                  GestureDetector(
                      onTap: () async {
                        final selectedRoom = await _selectedLocation(context);
                        if (selectedRoom != null) {
                          setState(() {
                            selectedRoomId = selectedRoom;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 151, 71, 255),
                        ),
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            selectedRoomId != null ? '${roomList[selectedRoomId!].name}' : 'Chưa chọn phòng',
                            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () async {
                          final selectedDevice = await _selectDevice(context, roomList[selectedRoomId!]);
                          if (selectedDevice != null) {
                            setState(() {
                              selectedDeviceId = selectedDevice;
                            });
                          }
                        },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 151, 71, 255),
                        ),
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            selectedDeviceId != null && selectedRoomId != null
                                ? '${roomList[selectedRoomId!].devices[selectedDeviceId!].name}'
                                : 'Chưa chọn chức năng',
                            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ),
            const SizedBox(height: 10,),
            GestureDetector(
                onTap: () async {
                  if (selectedRoomId != null) {
                    // Kiểm tra xem đã chọn thiết bị chưa
                    if (selectedDeviceId != null) {
                      // Nếu đã chọn thiết bị, chọn chức năng cho thiết bị đó
                      final selectedFunction = await _selectFunction(
                        context,
                        roomList[selectedRoomId!].devices[selectedDeviceId!],
                      );

                      if (selectedFunction != null) {
                        setState(() {
                          selectedFunDeviceId = selectedFunction;
                        });
                      }
                    } else {
                      // Nếu chưa chọn thiết bị, hiển thị thông báo hoặc thực hiện hành động phù hợp với trường hợp của bạn
                      print('Vui lòng chọn thiết bị trước khi chọn chức năng.');
                      // Hoặc thực hiện hành động khác tùy thuộc vào yêu cầu của bạn
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 151, 71, 255),
                  ),
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      selectedFunDeviceId != null &&
                        selectedDeviceId != null &&
                        selectedRoomId != null
                      ? '${roomList[selectedRoomId!].devices[selectedDeviceId!].fundevices[selectedFunDeviceId!].name}'
                      : 'Chưa chọn thiết bị',
                      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 151, 71, 255),
                  ),
                  height: 120,
                  padding:EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(decoration: InputDecoration(hintText:'Mô tả '),)
                ),
              SizedBox(height: 10,),
              Row(children: [
                GestureDetector(
                  onTap: () {},
                  child:Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 151, 71, 255),
                  ),
                  height: 80,
                  padding:EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width/2-25,
                  child: Column(children: [
                    const Icon(Icons.add_alarm_sharp,size: 40,),
                    const Text('Lưu',style: TextStyle(fontSize: 15),)
                  ],)
                ),
                ),
                
                SizedBox(width: 10,),

                GestureDetector(onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 151, 71, 255),
                  ),
                  height: 80,
                  padding:EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width/2-25,
                  child: Column(children: [
                    const Icon(Icons.power_settings_new_rounded,size: 40,),
                    const Text('Bật/Tắt',style: TextStyle(fontSize: 15),)
                  ],)
                ),),
              ],)
          ],
        ),
      ),
      ),
    );
  }
}