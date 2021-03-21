import 'package:bxg_bjj_scoreboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreHandlerUnit extends StatelessWidget {
  final PlayerType playerType;
  final int varianceUnit;
  final Color backgroundColor;

  const ScoreHandlerUnit(
      this.playerType, this.varianceUnit, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    Controller c = Get.find();

    var textStyle = TextStyle(color: Colors.white);

    return Container(
      color: this.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Expanded(
                child: FittedBox(
                  child: TextButton(
                    child: Text('+', style: textStyle),
                    onPressed: () =>
                        c.changePlayerScore(playerType, this.varianceUnit),
                  ),
                ),
              ),
              Expanded(
                child: FittedBox(
                    child: Text('${this.varianceUnit}', style: textStyle)),
              ),
              Expanded(
                child: FittedBox(
                  child: TextButton(
                    child: Text('-', style: textStyle),
                    onPressed: () =>
                        c.changePlayerScore(playerType, -1 * this.varianceUnit),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
