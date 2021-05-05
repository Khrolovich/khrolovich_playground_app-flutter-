import 'package:flutter/material.dart';
import 'package:khrolovich_playground_app/screens/main_screen.dart';

class TweenAnimationScreen extends StatefulWidget {
  @override
  _TweenAnimationScreenState createState() => _TweenAnimationScreenState();
}

class _TweenAnimationScreenState extends State<TweenAnimationScreen> {
  var _sliderValue = 0.0;
  Color _scuareColor = Colors.yellow;

  static final List<Widget> buttons = [
    ElevatedButton(
      onPressed: () {},
      child: Text('Color'),
    ),
    ElevatedButton(
      onPressed: () {},
      child: Text('Color'),
    ),
    ElevatedButton(
      onPressed: () {},
      child: Text('Color'),
    ),
    ElevatedButton(
      onPressed: () {},
      child: Text('Color'),
    ),
    // ElevatedButton(
    //   onPressed: changeColor(),
    //   child: Text('Color'),
    // ),
    // ElevatedButton(
    //   onPressed: changeColor(),
    //   child: Text('Color'),
    // ),
    // ElevatedButton(
    //   onPressed: changeColor(),
    //   child: Text('Color'),
    // ),
  ];

  Function changeColor() {
    return () {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Animation Builder'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Center(
              child: TweenAnimationBuilder(
                curve: Curves.easeInQuart,
                //child: Text('hello'),
                tween: Tween(begin: 150.0, end: _sliderValue * 300),
                duration: Duration(milliseconds: 500),
                builder: (context, value, child) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: value,
                    height: value,
                    color: _scuareColor,
                    child: Center(child: child),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 5,
            ),
            width: 320,
            child: Slider.adaptive(
              value: _sliderValue,
              onChanged: (double value) {
                setState(() {
                  if (value <= 0.2 || value >= 0.8) {
                    _scuareColor = Colors.red;
                  } else if (0.4 < value && value < 0.6) {
                    _scuareColor = Colors.green;
                  } else {
                    _scuareColor = Colors.yellow;
                  }
                  _sliderValue = value;
                });
              },
            ),
          ),
          //   Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Container(
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Container(
          //               width: 100,
          //               child: ElevatedButton(
          //                 onPressed: () {
          //                 },
          //                 child: Text('Color'),
          //               ),
          //             ),
          //             SizedBox(
          //               width: 10,
          //             ),
          //             Container(
          //               width: 100,
          //               child: ElevatedButton(
          //                 onPressed: () {},
          //                 child: Text('Color'),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
        ],
      ),
    );
  }
}
