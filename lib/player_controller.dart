import 'package:bxg_bjj_scoreboard/model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

enum PlayerType { green, red }
enum AdvOrPenType { adv, pen }

class PlayerController extends GetxController {
  RxList<PlayerData> _playerDataList =
      List.generate(PlayerType.values.length, (index) => PlayerData(0, 0, 0))
          .obs;

  void changePlayerScore(PlayerType playerType, int scoreVariance) {
    _playerDataList[playerType.index].score += scoreVariance;
    _playerDataList.refresh();
  }

  int getPlayerScore(PlayerType playerType) {
    return _playerDataList[playerType.index].score;
  }

  void changeAdvOrPen(
      PlayerType playerType, AdvOrPenType advOrPen, int pointVariance) {
    if (advOrPen == AdvOrPenType.adv) {
      _playerDataList[playerType.index].adv += pointVariance;
    } else {
      _playerDataList[playerType.index].pen += pointVariance;
    }

    _playerDataList.refresh();
  }

  int getPlayerAdvAndPen(PlayerType playerType, AdvOrPenType advOrPen) {
    if (advOrPen == AdvOrPenType.adv) {
      return _playerDataList[playerType.index].adv;
    }
    return _playerDataList[playerType.index].pen;
  }

  TextEditingController getPlayerTextEditingController(PlayerType playerType) {
    return _playerDataList[playerType.index].textEditingController;
  }
}
