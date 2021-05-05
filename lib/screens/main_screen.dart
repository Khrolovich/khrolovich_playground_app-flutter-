import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/AnimationsScreen'),
                child: Text('Animations')),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/WeatherAppMyHomePage'),
                child: Text('Weather app')),
            // ElevatedButton(
            //     onPressed: () => Navigator.pushNamed(context, '/StatesScreen'),
            //     child: Text('State Management')),
          ],
        ),
      ),
    );
  }
}
