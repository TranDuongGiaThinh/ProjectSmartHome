import 'package:flutter/material.dart';
import 'package:smart_home/model/user.dart';
import 'package:smart_home/presenter/language_presenter.dart';
import 'package:smart_home/presenter/user_presenter.dart';

class PermissionEditting extends StatefulWidget {
  const PermissionEditting({super.key, required this.user});
  final User user;

  @override
  State<PermissionEditting> createState() => _PermissionEdittingState();
}

class _PermissionEdittingState extends State<PermissionEditting> {
  late User tempUser;
  late List<String> items;

  @override
  void initState() {
    super.initState();
    
    tempUser = widget.user;
    items = LanguagePresenter.language.listRoom;
  }

  changeValueItem(int index) {
    setState(() {
      tempUser.permissions[index] = !tempUser.permissions[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${LanguagePresenter.language.permission}: ${UserPresenter.getStringPermission(tempUser)}"),
            Row(
              children: [
                for (int i = 0; i < items.length; i++)
                  Row(
                    children: [
                      Checkbox(
                          value: tempUser.permissions[i], onChanged: (value) => changeValueItem(i)),
                      GestureDetector(
                        onTap: () => changeValueItem(i),
                        child: Text(items[i]))
                    ],
                  )
              ],
            )
          ],
        ));
  }
}
