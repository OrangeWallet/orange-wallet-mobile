import 'package:flutter/material.dart';

class AddressInput extends StatefulWidget {
  final ValueChanged addressChange;
  final String errorMessage;

  AddressInput({@required this.addressChange, @required this.errorMessage});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<AddressInput> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Address',
//        suffixIcon: Icon(Icons.photo_camera),
        errorText: widget.errorMessage,
      ),
      keyboardType: TextInputType.number,
      onChanged: (str) {
        widget.addressChange(str);
      },
    );
  }
}
