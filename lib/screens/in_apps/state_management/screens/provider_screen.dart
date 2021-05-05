import 'package:flutter/material.dart';
import 'package:khrolovich_playground_app/screens/screen_widget.dart';
import 'package:provider/provider.dart';

class ProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
          create: (context) => MyProviderModel(),
          child: ScreenWidget(
        title: 'Provider',
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InheritedData(),
              SizedBox(
                height: 30,
              ),
              InheritedButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class InheritedData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'data',
      style: TextStyle(fontSize: 30),
    );
  }
}

class InheritedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(Icons.add),
    );
  }
}

class MyProviderModel extends ChangeNotifier{
  int counter = 0;
}
