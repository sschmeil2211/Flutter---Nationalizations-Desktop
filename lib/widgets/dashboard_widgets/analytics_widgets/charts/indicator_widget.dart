import 'package:flutter/material.dart';

import 'package:nationalizations/constants/constants.dart';

class ReferenceIndicator extends StatelessWidget {

  final Color referenceColor;
  final double referenceSize;
  final String referenceTitle;

  const ReferenceIndicator({
    required this.referenceSize,
    required this.referenceColor,
    required this.referenceTitle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : const EdgeInsets.symmetric(horizontal: appPadding),
      child   : Row(
        children: [
          Icon(
            Icons.circle,
            color : this.referenceColor,
            size  : this.referenceSize,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
            child: Text(
              this.referenceTitle,
              style: const TextStyle(
                color      : graphicTextColor,
                fontWeight : FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}