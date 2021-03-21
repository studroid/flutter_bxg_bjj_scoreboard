import 'package:bxg_bjj_scoreboard/controller.dart';
import 'package:flutter/cupertino.dart';

class PlayerInfo extends StatelessWidget {
  final PlayerType playerType;

  const PlayerInfo(this.playerType);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Text('a')),
        Expanded(child: Text('b')),
        Expanded(child: Text('c')),
      ],
    );
  }
}
