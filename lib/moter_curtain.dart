import 'package:flutter/material.dart';

class Curtain extends StatefulWidget {
  const Curtain({Key? key}) : super(key: key);

  @override
  State<Curtain> createState() => _CurtainState();
}

class _CurtainState extends State<Curtain> {
  double _leftPadding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'Phòng ngủ',
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Rèm',
                style: TextStyle(
                  color: Color.fromARGB(255, 192, 183, 183),
                  fontSize: 20,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.width * 0.7,
              ),
              Positioned(
                left: _leftPadding * 1.59,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Icon(
                      Icons.blur_on_sharp,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: _leftPadding * 1.59,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Icon(
                      Icons.blur_on_sharp,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            _leftPadding > 25.0 ? 'Rèm đóng' : 'Rèm mở',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                value: _leftPadding,
                onChanged: (value) {
                  setState(() {
                    _leftPadding = value;
                  });
                },
                min: 0.0,
                max: 50.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
