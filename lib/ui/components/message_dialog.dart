import 'package:flutter/material.dart';

class MessageDialog extends AlertDialog {
  final String _title;
  final String _message;
  final String _buttonText;
  final void Function()? _buttonAction;

  const MessageDialog(
      this._title, this._message, this._buttonText, this._buttonAction,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title),
      content: Text(_message),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20)),
            onPressed: () {
              _buttonAction ?? Navigator.of(context).pop();
            },
            child: Text(_buttonText))
      ],
    );
  }
}
