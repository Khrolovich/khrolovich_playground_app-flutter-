import 'package:flutter/material.dart';
import 'package:khrolovich_playground_app/screens/screen_widget.dart';

class BuiltInExplicitAnimation extends StatefulWidget {
  @override
  _BuiltInExplicitAnimationState createState() =>
      _BuiltInExplicitAnimationState();
}

class _BuiltInExplicitAnimationState extends State<BuiltInExplicitAnimation>
    with TickerProviderStateMixin {
  AnimationController rotationController;
  AnimationController sizeController;
  AnimationController scaleController;
  AnimationController fadeController;
  Animation<double> animation;

  bool ifReverse = false;
  Color backgroundColor = Color(0x00000000);
  Color rotationColor = Colors.greenAccent;
  Color sizeColor = Colors.greenAccent;
  Color scaleColor = Colors.greenAccent;

  int rotateDuration = 1500;
  int sizeDuration = 1000;
  int scaleDuration = 1000;

  bool rotateIsDone = false;
  bool sizeIsDone = false;
  bool scaleIsDone = false;

  String rotationText = 'rotate';
  String sizeText = 'size';
  String scaleText = 'scale';

  Function onTap(AnimationController _controller) {
    String _case = 'lol';
    if (_controller == rotationController) {
      _case = 'rotate';
    } else if (_controller == sizeController) {
      _case = 'size';
    } else if (_controller == scaleController) {
      _case = 'scale';
    } else {
      print('Cannot identify controller type');
    }
    //print(_case);

    return () {
      if (!rotateIsDone || !sizeIsDone || !scaleIsDone) {
        changeDuration(_case);
        if (_controller == rotationController && !rotateIsDone) {
          if (_controller.isAnimating) {
            setState(() {
              rotationColor = Colors.yellowAccent;
            });
            _controller.stop();
          } else {
            ifReverse = !ifReverse;
            _controller.repeat(
              reverse: ifReverse,
            );
            setState(() {
              rotationColor = Colors.greenAccent;
            });
          }
        } else {
          if (_controller.isAnimating && _controller != rotationController) {
            _controller.repeat();
          }
        }
      } else {
        Future.delayed(Duration(seconds: 5), () {
          fadeController.reverse();
        });
      }
    };
  }

  void changeDuration(String _ourCase) {
    switch (_ourCase) {
      case 'rotate':
        {
          if (rotateDuration > 100) {
            rotateDuration -= 100;
            rotationController.duration =
                Duration(milliseconds: rotateDuration);
          } else if (rotateDuration > 95) {
            rotateDuration -= 1;
            rotationController.duration =
                Duration(milliseconds: rotateDuration);
          } else {
            setState(() {
              rotateIsDone = true;
              setBackgroundColorIfEveryDone();
              rotationText = 'it\'s';
              rotationColor = Colors.yellowAccent;
              rotationController.reset();
              rotationController.stop();
            });
          }
        }
        break;
      case 'size':
        {
          if (sizeDuration > 100) {
            sizeDuration -= 100;
            sizeController.duration = Duration(milliseconds: sizeDuration);
          } else if (sizeDuration > 95) {
            sizeDuration -= 1;
            sizeController.duration = Duration(milliseconds: sizeDuration);
          } else {
            setState(() {
              sizeIsDone = true;
              setBackgroundColorIfEveryDone();
              sizeText = 'too,';
              sizeColor = Colors.yellowAccent;
              sizeController.stop();
              sizeController.value = 1;
            });
          }
        }
        break;
      case 'scale':
        {
          if (scaleDuration > 100) {
            scaleDuration -= 100;
            scaleController.duration = Duration(milliseconds: scaleDuration);
          } else if (scaleDuration > 95) {
            scaleDuration -= 1;
            scaleController.duration = Duration(milliseconds: scaleDuration);
          } else {
            scaleIsDone = true;
            setBackgroundColorIfEveryDone();
            setState(() {
              scaleText = 'bro';
              scaleColor = Colors.yellowAccent;
              scaleController.stop();
              scaleController.value = 0.7;
            });
          }
        }
        break;
    }
  }

  void setBackgroundColorIfEveryDone() {
    if (rotateIsDone && sizeIsDone && scaleIsDone) {
      backgroundColor = Colors.black;
    }
  }

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
      duration: Duration(milliseconds: rotateDuration),
      vsync: this,
    )..repeat();
    sizeController = AnimationController(
      duration: Duration(milliseconds: sizeDuration),
      vsync: this,
    )..repeat();
    scaleController = AnimationController(
      duration: Duration(milliseconds: scaleDuration),
      vsync: this,
    )..repeat();
    fadeController = AnimationController(
      duration: Duration(milliseconds: rotateDuration),
      vsync: this,
      value: 1,
      lowerBound: 0,
      upperBound: 1,
    );
    animation = CurvedAnimation(parent: fadeController, curve: Curves.easeIn);
    fadeController.forward();
    fadeController.stop();
  }

  @override
  void dispose() {
    rotationController.dispose();
    sizeController.dispose();
    scaleController.dispose();
    fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      title: 'Built-In Explicit Animation',
      body: AnimatedContainer(
        duration: Duration(seconds: 5),
        curve: Curves.bounceOut,
        color: backgroundColor,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              child: ScaleTransition(
                scale: scaleController,
                child: RotationTransition(
                  turns: rotationController,
                  child: Container(
                    width: 50,
                    height: 15,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            ),
            Center(
              child: FadeTransition(
                opacity: fadeController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: onTap(rotationController),
                      child: RotationTransition(
                        turns: rotationController,
                        alignment: Alignment.center,
                        child: Container(
                          color: rotationColor,
                          child: Text(
                            rotationText,
                            textScaleFactor: 4,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      child: GestureDetector(
                        onTap: onTap(sizeController),
                        child: Container(
                          child: SizeTransition(
                            sizeFactor: sizeController,
                            child: Container(
                              color: sizeColor,
                              child: Text(
                                sizeText,
                                textScaleFactor: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ScaleTransition(
                      scale: scaleController,
                      child: GestureDetector(
                        onTap: onTap(scaleController),
                        child: Container(
                          color: scaleColor,
                          child: Text(
                            scaleText,
                            textScaleFactor: 6,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
