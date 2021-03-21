import 'package:flutter/widgets.dart';

class PlayerData {
  int score = 0;
  int adv = 0;
  int pen = 0;
  final TextEditingController textEditingController = TextEditingController();

  PlayerData(this.score, this.adv, this.pen);
}
