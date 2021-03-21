import 'dart:async';

import 'package:get/get.dart';

const int DEFAULT_TIME_IN_MS = 6 * 60 * 1000;

class TimerController extends GetxController {
  RxInt _remainingTimeInMs = DEFAULT_TIME_IN_MS.obs;
  RxBool isOngoing = false.obs;
  Timer? _timer;

  int get remainingMinutes => (_remainingTimeInMs / 1000) ~/ 60;
  int get remainingSeconds => (_remainingTimeInMs ~/ 1000) % 60;

  void changeRemainingTime(int timeVarianceInMs) {
    _remainingTimeInMs += timeVarianceInMs;
  }

  void startTimer() {
    isOngoing.value = true;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      _remainingTimeInMs -= 100;
    });
  }

  void stopTimer() {
    isOngoing.value = false;
    _timer?.cancel();
  }

  void resetData() {
    isOngoing.value = false;
    _remainingTimeInMs.value = DEFAULT_TIME_IN_MS;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = null;
  }
}
