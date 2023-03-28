import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:nationalizations/constants/constants.dart';

class AnalyticInfoCard extends StatelessWidget {

  final int count;
  final String svgSrc;
  final String titleCard;

  const AnalyticInfoCard({
    required this.count,
    required this.svgSrc,
    required this.titleCard,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding    : const EdgeInsets.symmetric(horizontal: appPadding, vertical: appPadding / 2),
      decoration : BoxDecoration(
        color        : const Color(0xFFCDCDCD),
        borderRadius : BorderRadius.circular(10),
        boxShadow    : [
          BoxShadow(
            color        : const Color(0xFFCDCDCD).withOpacity(0.4),
            spreadRadius : 3,
            blurRadius   : 7,
            offset       : const Offset(0, 0)
          ),
        ]
      ),
      child      : Column(
        crossAxisAlignment : CrossAxisAlignment.start,
        mainAxisAlignment  : MainAxisAlignment.spaceBetween,
        children           : [
          Row(
            mainAxisAlignment : MainAxisAlignment.spaceBetween,
            children          : [
              Text(
                "${this.count}",
                style: const TextStyle(
                  color      : textColor,
                  fontSize   : 18,
                  fontWeight : FontWeight.w800,
                ),
              ),
              Container(
                padding : const EdgeInsets.all(appPadding / 2),
                height  : 40,
                width   : 40,
                child   : SvgPicture.asset(this.svgSrc),
              )
            ],
          ),
          Text(
            this.titleCard,
            maxLines : 1,
            overflow : TextOverflow.ellipsis,
            style    : const TextStyle(
              color      : textColor,
              fontSize   : 15,
              fontWeight : FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
