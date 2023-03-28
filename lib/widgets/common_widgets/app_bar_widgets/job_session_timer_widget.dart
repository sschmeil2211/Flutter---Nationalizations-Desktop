import 'dart:async';
import 'package:flutter/material.dart';

import 'package:nationalizations/constants/constants.dart';

class JobSessionTimer extends StatefulWidget {

  const JobSessionTimer({super.key});

  @override
  State<JobSessionTimer> createState() => _JobSessionTimerState();
}

class _JobSessionTimerState extends State<JobSessionTimer> {

  Duration duration = const Duration();
  Timer? timer;

  bool countDown = true;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer(){
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() => duration = Duration(seconds: duration.inSeconds + 1))
    );
  }

  @override
  Widget build(BuildContext context) {

    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final String hours = twoDigits(duration.inHours);
    final String minutes = twoDigits(duration.inMinutes.remainder(60));
    final String seconds = twoDigits(duration.inSeconds.remainder(60));

    return Padding(
      padding : const EdgeInsets.symmetric(vertical: appPadding / 2, horizontal: appPadding),
      child   : Row(
        mainAxisAlignment  : MainAxisAlignment.end,
        crossAxisAlignment : CrossAxisAlignment.end,
        children           : timeValues(hours, minutes, seconds),
      ),
    );
  }

  List<Widget> timeValues(String hour, String minute, String second){
    return [
      Text(
        "$hour : ",
        style: const TextStyle(
          fontWeight : FontWeight.bold,
          color      : grey,
          fontSize   : 20
        ),
      ),
      Text(
        "$minute : ",
        style: const TextStyle(
          fontWeight : FontWeight.bold,
          color      : grey,
          fontSize   : 20
        ),
      ),
      Text(
        second,
        style: const TextStyle(
          fontWeight : FontWeight.bold,
          color      : grey,
          fontSize   : 20
        ),
      ),
    ];
  }
}

