import 'package:flutter/material.dart';

import 'package:nationalizations/constants/constants.dart';

class SearchField extends StatelessWidget {

  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height : 35,
        margin : const EdgeInsets.symmetric(horizontal: 40),
        child  : TextField(
          style      : const TextStyle(
            color      : textColor,
            fontWeight : FontWeight.w600
          ),
          decoration : InputDecoration(
            contentPadding : const EdgeInsets.symmetric(vertical: 0),
            hintText       : "Search client",
            fillColor      : Colors.white60,
            filled         : true,
            hintStyle      : const TextStyle(
              color      : darkGrey,
              fontWeight : FontWeight.w300
            ),
            border         : OutlineInputBorder(
              borderSide   : BorderSide.none,
              borderRadius : BorderRadius.circular(25)
            ),
            prefixIcon     : const Padding(
              padding : EdgeInsets.only(left: appPadding, right: appPadding / 2),
              child   : Icon(
                Icons.search,
                color: darkGrey
              ),
            ),
          ),
        ),
      ),
    );
  }
}
