import 'package:flutter/material.dart';
import 'package:nationalizations/constants/app_values_design.dart';

class NoteDialog extends StatelessWidget {

  final Color dialogButtonColor;
  final String dialogTitle;
  final String dialogButtonTitle;
  final void Function() onPressed;
  final Widget dialogContent;

  const NoteDialog({
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
      backgroundColor : drawerColor,
      buttonPadding   : const EdgeInsets.symmetric(horizontal: 25),
      title           : Text(this.dialogTitle),
      shape           : RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      content         : this.dialogContent,
      actions         : [
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