import 'package:bxg_bjj_scoreboard/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvOrPen extends StatelessWidget {
  final PlayerType playerType;
  final AdvOrPenType advOrPenType;

  const AdvOrPen(this.playerType, this.advOrPenType);

  @override
  Widget build(BuildContext context) {
    PlayerController c = Get.find();

    var textStyle = TextStyle(color: Colors.white);

    String advOrPenDisplay =
        (this.advOrPenType == AdvOrPenType.adv) ? 'Adv' : 'Pen';

    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Row(
            children: [
              Spacer(),
              Expanded(
                flex: 4,
                child: FittedBox(
                  child: TextButton(
                    child: Text('-', style: textStyle),
                    onPressed: () => c.changeAdvOrPen(
                        this.playerType, this.advOrPenType, -1),
                  ),
                ),
              ),
              Expanded(
                child: FittedBox(
                  child: Text(
                      '${c.getPlayerAdvAndPen(this.playerType, this.advOrPenType)}',
                      style: textStyle),
                ),
              ),
              Expanded(
                flex: 4,
                child: FittedBox(
                  child: TextButton(
                    child: Text('+', style: textStyle),
                    onPressed: () =>
                        c.changeAdvOrPen(this.playerType, this.advOrPenType, 1),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        Expanded(flex: 2, child: FittedBox(child: Text(advOrPenDisplay))),
      ],
    );
  }
}
