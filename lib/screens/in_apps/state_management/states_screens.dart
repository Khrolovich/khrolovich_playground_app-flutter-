import 'package:flutter/material.dart';
import 'package:khrolovich_playground_app/screens/screen_widget.dart';

class StatesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      title: 'States',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/SetState'),
              child: Text('setState'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/EnheritedWidgetScreen'),
              child: Text('EnheritedWidget'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/ProviderScreen'),
              child: Text('Provider'),
            ),
          ],
        ),
      ),
    );
  }
}
