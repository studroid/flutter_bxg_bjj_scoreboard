import 'package:get/get.dart';

enum PlayerType { blue, red }

class Controller extends GetxController {
  RxInt blueScore = 0.obs;
  RxInt redScore = 0.obs;

  void changePlayerScore(PlayerType player, int scoreVariance) {
    switch (player) {
      case PlayerType.blue:
        blueScore += scoreVariance;
        break;
      case PlayerType.red:
        redScore += scoreVariance;
        break;
    }
  }
/*
Shorter, but logically more complex alternative

  List<RxInt> scoreList = List.filled(PlayerType.values.length, 0.obs);

  void changePlayerScore(PlayerType player, int scoreVariance) {
    scoreList[player.index] += scoreVariance;
  }
*/

}
