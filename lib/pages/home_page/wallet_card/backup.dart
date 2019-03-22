import 'package:flutter/material.dart';

class BackupWidget extends StatelessWidget {
  final bool isBackup;

  BackupWidget(this.isBackup);

  @override
  Widget build(BuildContext context) {
    if (isBackup) {
      return Row(
        children: <Widget>[
          SizedBox(width: 25),
          Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 17,
          ),
          SizedBox(width: 5),
          Text(
            'Backed up',
            style: TextStyle(fontSize: 15, color: Colors.white),
          )
        ],
      );
    }
    return null;
  }
}
