import 'package:bxg_bjj_scoreboard/model.dart';
import 'package:get/get.dart';

enum PlayerType { green, red }
enum AdvOrPenType { adv, pen }

const double DEFAULT_TIME_IN_MS = 6.0 * 60 * 1000;

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

  RxDouble remainingTimeInMs = DEFAULT_TIME_IN_MS.obs;
}
