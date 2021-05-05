import 'package:flutter/material.dart';
import 'package:khrolovich_playground_app/screens/screen_widget.dart';

class ImplicitAnimationScreen extends StatefulWidget {
  @override
  _ImplicitAnimationScreenState createState() =>
      _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.red;
  double _buttonHeight = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      title: 'Implicit Animation',
      info:
          'I change circle\'s color and size using setStete() when user taps on the circle and when animation complete after 2 seconds duration. \n\nA \'little more\' button is exist.',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_width > 250) {
                      _buttonHeight = 40;
                    }
                    _width += 50;
                    _height += 50;
                    if (_color == Colors.red) {
                      _color = Colors.redAccent;
                    } else if (_color == Colors.redAccent) {
                      _color = Colors.deepOrange;
                    } else if (_color == Colors.deepOrange) {
                      _color = Colors.deepOrangeAccent;
                    } else if (_color == Colors.deepOrangeAccent) {
                      _color = Colors.amber;
                    } else if (_color == Colors.amber) {
                      _color = Colors.amberAccent;
                    } else if (_color == Colors.amberAccent) {
                      _color = Colors.yellow;
                    } else if (_color == Colors.yellow) {
                      _color = Colors.yellowAccent;
                    } else if (_color == Colors.yellowAccent) {
                      _color = Colors.yellow[200];
                    } else if (_color == Colors.yellow[200]) {
                      _color = Colors.yellow[50];
                    } else {
                      _color = Colors.white;
                    }
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(
                    seconds: 2,
                  ),
                  curve: Curves.easeInOutCubic,
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _color,
                  ),
                  onEnd: () {
                    setState(() {
                      _width = 100;
                      _height = 100;
                      _color = Colors.red;
                    });
                  },
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: AnimatedContainer(
              height: _buttonHeight,
              duration: Duration(milliseconds: 1000),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/MoreImplicitAnimations');
                },
                child: Text('little more'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
