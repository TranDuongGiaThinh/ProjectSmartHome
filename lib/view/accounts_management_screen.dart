import 'package:flutter/material.dart';
import 'package:smart_home/presenter/language_presenter.dart';
import 'package:smart_home/presenter/user_presenter.dart';
import 'package:smart_home/view/custom_button.dart';
import 'package:smart_home/model/user.dart';

class AccountsManagementScreen extends StatefulWidget {
  const AccountsManagementScreen({super.key, required this.buildInfoUser});
  final Function(bool iconButtonLogOut, User u) buildInfoUser;

  @override
  State<AccountsManagementScreen> createState() =>
      _AccountsManagementScreenState();
}

class _AccountsManagementScreenState extends State<AccountsManagementScreen> {
  List<User> users = [UserPresenter.user];
  User? userSelected;

  updateUserSelected(User newSelected) {
    setState(() {
      userSelected = newSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(LanguagePresenter.language.setting))),
      body: ListView(
        children: [
          buildListUser(),
          if (userSelected != null) widget.buildInfoUser(false, userSelected!),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CustomButton(
                context: context,
                action: (){addNewUser();},
                height: 100,
                content: LanguagePresenter.language.addNewUser,
                icon: Icons.person_add_alt,
              ))
        ],
      ),
    );
  }

  Widget buildListUser() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Table(
          border: TableBorder.all(),
          children: [
            TableRow(
              decoration: BoxDecoration(color: Colors.grey[300]),
              children: [
                TableCell(
                  child: Center(child: Text(LanguagePresenter.language.userName)),
                ),
                TableCell(
                  child: Center(child: Text(LanguagePresenter.language.fullName)),
                ),
                TableCell(
                  child: Center(child: Text(LanguagePresenter.language.permission)),
                ),
                TableCell(
                  child: Center(child: Text(LanguagePresenter.language.blocked)),
                ),
              ],
            ),
            for (int i = 0; i < users.length; i++)
              TableRow(
                decoration: BoxDecoration(
                  color: users[i] == userSelected ? Colors.blue : null,
                ),
                children: [
                  TableCell(
                      child: InkWell(
                    onTap: () {
                      updateUserSelected(users[i]);
                    },
                    child: Center(child: Text(users[i].userName)),
                  )),
                  TableCell(
                    child: Center(child: Text(users[i].fullName)),
                  ),
                  TableCell(
                    child: Center(
                        child: Text(
                            users[i].getStringPermission())),
                  ),
                  TableCell(
                      child: Center(
                    child: Checkbox(
                      value: users[i].blocked,
                      onChanged: null,
                    ),
                  )),
                ],
              ),
          ],
        ));
  }

  addNewUser() {}
}
