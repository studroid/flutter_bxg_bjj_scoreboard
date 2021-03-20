import 'package:bxg_bjj_scoreboard/components/score_handler_unit.dart';
import 'package:bxg_bjj_scoreboard/controller.dart';
import 'package:flutter/material.dart';

class ScoreHandler extends StatelessWidget {
  final PlayerType playerType;

  const ScoreHandler(this.playerType);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScoreHandlerUnit(playerType, 4, Colors.black54),
          ScoreHandlerUnit(playerType, 3, Colors.black45),
          ScoreHandlerUnit(playerType, 2, Colors.black38),
        ],
      ),
    );
  }
}
