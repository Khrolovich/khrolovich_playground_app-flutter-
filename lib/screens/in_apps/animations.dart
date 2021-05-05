import 'package:flutter/material.dart';

class AnimationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/ImplicitAnimationScreen'),
              child: Text('Implicit Animation'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/TweenAnimationScreen'),
              child: Text('Tween Animation Builder'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/BuiltInExplicitAnimation'),
              child: Text('Built-In Explicit Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
