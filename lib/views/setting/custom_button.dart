import 'package:flutter/material.dart';
import 'package:smart_home/models/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.context,
    required this.icon,
    required this.content,
    required this.action,
    double? width,
    double? height,
    Color? color,
  })  : width = width ?? MediaQuery.of(context).size.width,
        height = height ?? 50,
        color = color ?? Constants.colorButton;

  final BuildContext context;
  final IconData icon;
  final String content;
  final double width;
  final double height;
  final Color color;
  final Function() action;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 10,
      ),
      GestureDetector(
        onTap: action,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: color),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,color: Colors.white),
              Container(width: 10),
              Text(
                content,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
