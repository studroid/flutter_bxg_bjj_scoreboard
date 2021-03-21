import 'dart:async';

import 'package:get/get.dart';

const int DEFAULT_TIME_IN_MS = 6 * 60 * 1000;

class TimerController extends GetxController {
  RxInt _remainingTimeInMs = DEFAULT_TIME_IN_MS.obs;
  Timer? _timer;

  int get remainingMinutes => (_remainingTimeInMs / 1000) ~/ 60;
  int get remainingSeconds => (_remainingTimeInMs ~/ 1000) % 60;

  void changeRemainingTime(int timeVarianceInMs) {
    _remainingTimeInMs += timeVarianceInMs;
  }

  RxBool get isOngoing => (_timer != null && _timer!.isActive).obs;

  void startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      _remainingTimeInMs -= 100;
    });
  }

  void stopTimer() {
    _timer!.cancel();
  }

  void resetData() {
    _remainingTimeInMs.value = DEFAULT_TIME_IN_MS;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = null;
  }
}
