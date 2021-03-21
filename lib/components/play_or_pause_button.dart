import 'package:bxg_bjj_scoreboard/timer_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayOrPauseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TimerController tc = Get.find();

    return Obx(
      () => tc.isOngoing.value!
          ? IconButton(
              icon: const Icon(Icons.pause_circle_outline),
              padding: EdgeInsets.zero,
              iconSize: 35,
              onPressed: () {
                tc.stopTimer();
              },
            )
          : IconButton(
              icon: const Icon(Icons.play_circle_outline),
              padding: EdgeInsets.zero,
              iconSize: 35,
              onPressed: () {
                tc.startTimer();
              },
            ),
    );
  }
}
