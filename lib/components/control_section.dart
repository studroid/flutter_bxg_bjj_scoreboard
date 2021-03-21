import 'package:bxg_bjj_scoreboard/components/play_or_pause_button.dart';
import 'package:bxg_bjj_scoreboard/player_controller.dart';
import 'package:bxg_bjj_scoreboard/timer_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TimerController tc = Get.put(TimerController())!;
    final PlayerController pc = Get.find();

    return Obx(
      () => Container(
        color: Colors.white,
        child: Row(
          children: [
            Spacer(flex: 3),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: IconButton(
                  icon: const Icon(Icons.refresh),
                  padding: EdgeInsets.zero,
                  iconSize: 35,
                  onPressed: () {
                    tc.resetData();
                    pc.resetData();
                  },
                ),
              ),
            ),
            Spacer(flex: 2),
            Expanded(
              flex: 2,
              child: FittedBox(
                child: TextButton(
                  child: Text('-'),
                  onPressed: () => tc.changeRemainingTime(-10000),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: FittedBox(
                child: Center(
                    child: Text(
                        '${tc.remainingMinutes.toString().padLeft(2, '0')}:${tc.remainingSeconds.toString().padLeft(2, '0')}')),
              ),
            ),
            Expanded(
              flex: 2,
              child: FittedBox(
                child: TextButton(
                  child: Text('+'),
                  onPressed: () => tc.changeRemainingTime(10000),
                ),
              ),
            ),
            Spacer(flex: 2),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: PlayOrPauseButton(),
              ),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
