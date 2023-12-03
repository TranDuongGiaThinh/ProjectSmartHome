import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    color:Colors.black,
  );
}

TextFormField resuableTextFile(
  String text,
  IconData icon,
  bool isPasswordType,
  bool isPhone, // Thêm tham số để xác định loại TextField
  TextEditingController controller,
  String? Function(String?)? validator,
) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPhone
        ? TextInputType.phone // Nếu là số điện thoại, sử dụng TextInputType.phone
        : isPasswordType
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
    inputFormatters: isPhone
        ? [FilteringTextInputFormatter.digitsOnly]
        : [], // Chỉ cho phép nhập chữ số nếu là số điện thoại
    maxLength: isPhone ? 10 : null, // Giới hạn độ dài số điện thoại nếu là số điện thoại
    validator: validator,
  );
}



Row resualRow(String texts, bool values, VoidCallback onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(texts,style: const TextStyle(color: Colors.white,fontSize: 18),),
      GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Checkbox(
            value: values,
            onChanged: (value) {
              onTap();
            },
            activeColor: Colors.blue, // Màu của ô tick khi được chọn
            checkColor: Colors.white, // Màu của dấu tích trong ô tick
            //fillColor: MaterialStateProperty.all(Colors.red), // Màu nền của ô tick khi không chọn
            side: const BorderSide(color: Colors.white), // Viền của ô tick
            visualDensity: const VisualDensity(
              vertical: -1, // Điều chỉnh kích thước dọc của ô tick
            ),
            materialTapTargetSize: MaterialTapTargetSize.padded,
          ),
        ),
      ),
    ],
  );
}


Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width*0.6,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ),
  );
}
//d
