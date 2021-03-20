import 'package:get/get.dart';

enum PlayerType { blue, red }

class Controller extends GetxController {
//  var scoreList = List.filled(PlayerType.values.length, 0.obs);
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
}
