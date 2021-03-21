import 'package:bxg_bjj_scoreboard/components/adv_or_pen.dart';
import 'package:bxg_bjj_scoreboard/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerInfo extends StatelessWidget {
  final PlayerType playerType;

  const PlayerInfo(this.playerType);

  @override
  Widget build(BuildContext context) {
    PlayerController c = Get.find();

    double dynamicFontSizeCriterion = MediaQuery.of(context).size.height;
    var textStyle = TextStyle(color: Colors.white);
    Color bgColor = Colors.green;

    if (playerType == PlayerType.red) {
      bgColor = Colors.red;
    }

    return Obx(
      () => Container(
        color: bgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Expanded(
              flex: 1,
              child: TextField(
                controller: c.getPlayerTextEditingController(this.playerType),
                style: textStyle.merge(
                    TextStyle(fontSize: dynamicFontSizeCriterion * 0.035)),
                textAlign: TextAlign.center,
                decoration: InputDecoration.collapsed(hintText: 'Player Name'),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                '${c.getPlayerScore(this.playerType)}',
                style: textStyle
                    .merge(TextStyle(fontSize: dynamicFontSizeCriterion * 0.1)),
              ),
            ),
            Expanded(
                flex: 2, child: AdvOrPen(this.playerType, AdvOrPenType.adv)),
            Expanded(
                flex: 2, child: AdvOrPen(this.playerType, AdvOrPenType.pen)),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
