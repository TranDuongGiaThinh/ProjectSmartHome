import 'package:flutter/material.dart';
import 'package:smart_home/view/accounts_management_screen.dart';

class Sign_Up_Screen extends StatefulWidget {
  const Sign_Up_Screen({super.key});

  @override
  State<Sign_Up_Screen> createState() => _Sign_Up_ScreenState();
}

class _Sign_Up_ScreenState extends State<Sign_Up_Screen> {
  String? val = "1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: const Text('Tạo tài khoản'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp),
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => AccountsManagementScreen(),
              //     )
              //    );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
                width: 300,
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // // width:300
                    children: [
                      SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "sign up",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          //   controller: Null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: "Họ & tên",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          //   controller: Null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: "Số điện thoại",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          //   controller: Null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: "Tài khoản",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          //   controller: Null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: "Mật khẩu",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          //   controller: Null,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          width:
                              280, // Định nghĩa chiều rộng của DropdownButton
                          decoration: BoxDecoration(
                            color: Colors.grey, // Màu nền của DropdownButton
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: DropdownButton<String>(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(20),
                            icon: null,
                            value: val,
                            items:
                                <String>['1', '2', '3', '4'].map((String val) {
                              return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(
                                    val,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ));
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                val = value!;
                              });
                            },
                          ))
                    ])),
          ),
        ));
  }
}
