import 'package:bxg_bjj_scoreboard/timer_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TimerController tc = Get.put(TimerController())!;

    return Obx(
      () => Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                'a',
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: TextButton(
                  child: Text('-'),
                  onPressed: () => tc.changeRemainingTime(-10000),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: FittedBox(
                child: Center(
                    child: Text(
                        '${tc.remainingMinutes.toString().padLeft(2, '0')}:${tc.remainingSeconds.toString().padLeft(2, '0')}')),
              ),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: TextButton(
                  child: Text('+'),
                  onPressed: () => tc.changeRemainingTime(10000),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                'a',
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }
}
