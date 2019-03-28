import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<Test> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? CircularProgressIndicator()
            : Center(
                child: RaisedButton(
                  onPressed: () {},
                ),
              ));
  }
}
