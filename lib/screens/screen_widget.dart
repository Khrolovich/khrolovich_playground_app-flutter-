import 'package:flutter/material.dart';

class ScreenWidget extends StatelessWidget {
  final String title;
  final Widget body;
  final String info;
  ScreenWidget({@required this.title, @required this.body, this.info = 'none'});
  @override
  Widget build(BuildContext context) {
    if (info != 'none') {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Info'),
                      content: Text(info),
                      scrollable: true,
                    ),
                  );
                }
                // => SimpleDialog(
                //   //title: Text('Info'),
                // content: Text(description),
                // scrollable: true,
                // ),
                )
          ],

          //           AlertDialog(
          // title: Text('Info'),
          // content: Text(description),
          // scrollable: true,
          // ),
        ),
        body: body,
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: body,
      );
    }
  }
}
