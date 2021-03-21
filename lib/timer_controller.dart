import 'package:get/get.dart';

const int DEFAULT_TIME_IN_MS = 6 * 60 * 1000;

class TimerController extends GetxController {
  RxInt _remainingTimeInMs = DEFAULT_TIME_IN_MS.obs;

  int get remainingMinutes => (_remainingTimeInMs / 1000) ~/ 60;
  int get remainingSeconds => (_remainingTimeInMs ~/ 1000) % 60;

  void changeRemainingTime(int timeVarianceInMs) {
    _remainingTimeInMs += timeVarianceInMs;
  }
}
