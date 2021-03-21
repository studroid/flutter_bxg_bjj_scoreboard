import 'package:get/get.dart';

enum PlayerType { green, red }

const double DEFAULT_TIME_IN_MS = 6.0 * 60 * 1000;

class Controller extends GetxController {
  RxList<int> _scoreList = List.filled(PlayerType.values.length, 0).obs;

  void changePlayerScore(PlayerType playerType, int scoreVariance) {
    _scoreList[playerType.index] += scoreVariance;
  }

  int getPlayerScore(PlayerType playerType) {
    return _scoreList[playerType.index];
  }

  RxDouble remainingTimeInMs = DEFAULT_TIME_IN_MS.obs;
}
