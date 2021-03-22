import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:soundpool/soundpool.dart';

const int DEFAULT_TIME_IN_MS = 6 * 60 * 1000 + 999;

class TimerController extends GetxController {
  RxInt _remainingTimeInMs = DEFAULT_TIME_IN_MS.obs;
  RxBool isOngoing = false.obs;
  Timer? _timer;

  Soundpool? _pool;
  late int _soundId;

  int get remainingMinutes => (_remainingTimeInMs / 1000) ~/ 60;
  int get remainingSeconds => (_remainingTimeInMs ~/ 1000) % 60;

  TimerController() {
    _pool = Soundpool();
    rootBundle.load("assets/beep.wav").then(
          (asset) => _pool!.load(asset).then((id) => _soundId = id),
        );
  }

  void changeRemainingTime(int timeVarianceInMs) {
    if (timeVarianceInMs < 0 &&
        (_remainingTimeInMs.value + timeVarianceInMs) < 0) {
      _remainingTimeInMs.value = 0;
    } else {
      _remainingTimeInMs += timeVarianceInMs;
    }
  }

  void startTimer() {
    isOngoing.value = true;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_remainingTimeInMs > 100) {
        _remainingTimeInMs -= 100;
      }

      if (901 <= _remainingTimeInMs.value && _remainingTimeInMs.value <= 1000) {
        _pool!.play(_soundId);
      }
    });

    _pool!.play(_soundId);
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
