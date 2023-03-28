import 'package:flutter/material.dart';

class TaskDialog extends StatelessWidget {

  final Color dialogButtonColor;
  final String dialogTitle;
  final String dialogButtonTitle;
  final void Function() onPressed;
  final Widget dialogContent;

  const TaskDialog({
    required this.dialogButtonColor,
    required this.dialogTitle,
    required this.dialogButtonTitle,
    required this.onPressed,
    required this.dialogContent,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title   : Text(this.dialogTitle),
      content : this.dialogContent,
      actions : [
        TextButton(
          child     : const Text('Cancel'),
          onPressed : () => Navigator.pop(context),
        ),
        ElevatedButton(
          style     : ButtonStyle(
            backgroundColor: MaterialStateProperty.all(this.dialogButtonColor),
          ),
          onPressed : this.onPressed,
          child     : Text(this.dialogButtonTitle),
        ),
      ],
    );
  }
}