import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final String text;

  Loading({this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0x55000000),
        child: Center(
          child: SizedBox(
            width: 120.0,
            height: 120.0,
            child: Container(
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      text == null ? "loading" : text,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
