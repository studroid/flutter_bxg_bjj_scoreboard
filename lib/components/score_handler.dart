import 'package:bxg_bjj_scoreboard/components/score_handler_unit.dart';
import 'package:bxg_bjj_scoreboard/controller.dart';
import 'package:flutter/material.dart';

class ScoreHandler extends StatelessWidget {
  final PlayerType playerType;

  const ScoreHandler(this.playerType);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ScoreHandlerUnit(this.playerType, 4, Colors.black54)),
          Expanded(child: ScoreHandlerUnit(this.playerType, 3, Colors.black45)),
          Expanded(child: ScoreHandlerUnit(this.playerType, 2, Colors.black38)),
        ],
      ),
    );
  }
}
