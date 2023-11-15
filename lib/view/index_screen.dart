import 'package:flutter/material.dart';
import 'package:smart_home/view/bottom_nav.dart';
import 'package:smart_home/view/setting_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen(
      {super.key, required this.idUser, required this.reloadThemeMode});
  final int idUser;
  final Function reloadThemeMode;

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int selectedIndex = 0;

  void updateIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildSelectedContent();
  }

  Widget _buildSelectedContent() {
    switch (selectedIndex) {
      case 0:
        return _buildIndexScreen();
      case 1:
        //thống kê
        return Scaffold(
      body: Text("trang thống kê"),
      bottomNavigationBar: BottomNav(
        currentIndex: selectedIndex,
        updateIndex: updateIndex,
      ),
    );
      case 2:
        //lên lịch
        return Scaffold(
      body: Text("trang lên lich"),
      bottomNavigationBar: BottomNav(
        currentIndex: selectedIndex,
        updateIndex: updateIndex,
      ),
    );
      case 3:
        return SettingScreen(reloadThemeMode: widget.reloadThemeMode);
    }
    return const Placeholder();
  }

  Widget _buildIndexScreen() {
    return Scaffold(
      appBar: AppBar(title: Text("trang chủ")),
      body: Text("trang chủ"),
      bottomNavigationBar: BottomNav(
        currentIndex: selectedIndex,
        updateIndex: updateIndex,
      ),
    );
  }
}
