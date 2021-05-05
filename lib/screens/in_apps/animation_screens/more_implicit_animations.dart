import 'package:flutter/material.dart';
import 'package:khrolovich_playground_app/screens/screen_widget.dart';

class MoreImplicitAnimations extends StatefulWidget {
  @override
  _MoreImplicitAnimationsState createState() => _MoreImplicitAnimationsState();
}

class _MoreImplicitAnimationsState extends State<MoreImplicitAnimations> {
  static const _alignments = [
    Alignment.center,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.topLeft,
    Alignment.bottomLeft,
  ];
  Alignment _alignment = Alignment.center;
  int _alignCounter = 0;
  double _opacity = 1;
  EdgeInsetsGeometry padding = EdgeInsets.all(0);
  double _elevation = 0;
  double _squareSide = 100;
  double _topPosition = 0;
  double _leftPosition = 0;

  TextStyle _textStyle = _textStyles.first;
  int _changeCounter = 0;
  static const _textStyles = [
    TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      letterSpacing: 2,
      fontFamily: 'AmaticSC',
      fontSize: 25,
    ),
    TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.w900,
      letterSpacing: 10,
      fontFamily: 'Anton',
      fontSize: 25,
    ),
    TextStyle(
      color: Colors.purple,
      fontWeight: FontWeight.bold,
      letterSpacing: 6,
      fontFamily: 'Caveat',
      fontSize: 25,
    ),
  ];

  void changeTextStyle() {
    if (_changeCounter < _textStyles.length - 1) {
      _changeCounter++;
    } else {
      _changeCounter = 0;
    }
    _textStyle = _textStyles[_changeCounter];
  }

  void changeAlignment() {
    if (_alignCounter < _alignments.length - 1) {
      _alignCounter++;
    } else {
      _alignCounter = 0;
    }
    _alignment = _alignments[_alignCounter];
  }

  void changeOpacity() {
    if (_opacity == 1) {
      _opacity = 0.9;
    } else if (_opacity == 0.9) {
      _opacity = 0;
    } else {
      _opacity = 1;
    }
  }

  void changePadding() {
    if (padding == EdgeInsets.all(0)) {
      padding = EdgeInsets.all(30);
    } else {
      padding = EdgeInsets.all(0);
    }
  }

  void changeElevation() {
    _elevation = 30;
  }

  void changeHeartPosition() {
    if (_topPosition <= 60) {
      _topPosition += 20;
    } else {
      _topPosition = 0;
    }
    if (_leftPosition <= 60) {
      _leftPosition += 10;
    } else {
      _leftPosition = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      title: 'More Implicit',
      info:
          'I\'m used here:\nAnimatedAlign,\nAnimatedDefaultTextStyle,\nAnimatedOpacity,\nAnimatedPadding,\nAnimatedPhysicalModel,\nAnimatedPositioned',
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GestureDetector(
          onTap: () {
            changeAlignment();
            changeOpacity();
            changePadding();
            changeElevation();
            changeTextStyle();
            if (_opacity == 1) {
              changeHeartPosition();
            }
            setState(() {});
          },
          child: Container(
            color: Colors.white,
            child: AnimatedAlign(
              curve: Curves.easeInQuint,
              alignment: _alignment,
              duration: Duration(
                milliseconds: 1500,
              ),
              child: Container(
                child: AnimatedPhysicalModel(
                  onEnd: () {
                    setState(() {
                      _elevation = 0;
                    });
                  },
                  duration: Duration(seconds: 1),
                  shadowColor: Colors.black,
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  elevation: _elevation,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RotatedBox(
                            child: AnimatedText(_textStyle),
                            quarterTurns: 3,
                          ),
                          AnimatedPadding(
                            padding: padding,
                            duration: Duration(milliseconds: 1500),
                            child: Container(
                              //color: Colors.black,
                              width: _squareSide,
                              height: _squareSide,
                              child: Stack(children: [
                                AnimatedPositioned(
                                  top: _topPosition,
                                  left: _leftPosition,
                                  duration: Duration(milliseconds: 1000),
                                  child: Icon(Icons.favorite),
                                ),
                              ]),
                            ),
                          ),
                          RotatedBox(
                            child: AnimatedText(_textStyle),
                            quarterTurns: 1,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RotatedBox(
                            child: AnimatedText(_textStyle),
                            quarterTurns: 4,
                          ),
                          AnimatedOpacity(
                            curve: Curves.easeInCubic,
                            opacity: _opacity,
                            duration: Duration(seconds: 1),
                            child: Container(
                              color: Colors.black,
                              width: _squareSide,
                              height: _squareSide,
                            ),
                          ),
                          RotatedBox(
                            child: AnimatedText(_textStyle),
                            quarterTurns: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedText extends StatelessWidget {
  final TextStyle textStyle;
  AnimatedText(this.textStyle);

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      style: textStyle,
      duration: Duration(milliseconds: 1000),
      child: Text('side'),
    );
  }
}
