import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
        color = color ?? Colors.blue;

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(width: MediaQuery.of(context).size.width / 3),
              Icon(icon,color: Colors.white),
              Container(width: 10),
              Text(
                content,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
