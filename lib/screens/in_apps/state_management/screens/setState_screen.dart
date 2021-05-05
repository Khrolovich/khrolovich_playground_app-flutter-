import 'package:flutter/material.dart';
import 'package:khrolovich_playground_app/screens/screen_widget.dart';

class SetState extends StatefulWidget {
  @override
  _SetStateState createState() => _SetStateState();
}

class _SetStateState extends State<SetState> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      title: 'setState():    $_counter',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: Icon(Icons.plus_one),
            ),
          ],
        ),
      ),
    );
  }
}
