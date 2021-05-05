import 'package:flutter/material.dart';
import 'dart:math';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _width = 200.0;
  double _height = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow.shade900,
                ),
                onPressed: () => Navigator.pushNamed(context, '/MainScreen'),
                child: Text('Go'),
              ),
            ),
          ),
          Transform(
            transform: Matrix4.rotationZ(pi / 4),
            child: Container(
              color: Colors.yellow,
              width: _width,
              height: _height,
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Transform(
              alignment: Alignment.bottomRight,
              transform: Matrix4.rotationZ(pi / 4),
              child: Container(
                color: Colors.yellow,
                width: _width,
                height: _height,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
