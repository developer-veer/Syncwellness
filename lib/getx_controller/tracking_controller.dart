import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_activity_recognition/flutter_activity_recognition.dart';
import 'package:pedometer/pedometer.dart';

class TrackingController extends GetxController {
  var isTracking = false.obs;
  var stepsCount = 0.obs;
  var distanceWalked = 0.0.obs;
  late Stream<StepCount> _stepCountStream;
  late StreamSubscription<ActivityEvent> _activityStreamSubscription;
  late StreamSubscription<StepCount> _stepCountStreamSubscription;

  @override
  void onInit() {
    super.onInit();
    _initializePedometer();
  }

  void _initializePedometer() {
    _stepCountStream = Pedometer.stepCountStream;
  }

  void startTracking() {
    if (isTracking.value) return;

    isTracking.value = true;
    stepsCount.value = 0;
    distanceWalked.value = 0.0;

    _stepCountStreamSubscription = _stepCountStream.listen(_onStepCount);
    _activityStreamSubscription =
        FlutterActivityRecognition.instance.activityStream.listen(_onActivity);
  }

  void stopTracking() {
    if (!isTracking.value) return;

    isTracking.value = false;
    _stepCountStreamSubscription.cancel();
    _activityStreamSubscription.cancel();
  }

  void _onStepCount(StepCount event) {
    stepsCount.value = event.steps;
    distanceWalked.value = stepsCount.value * 0.8; // Average step length in meters
  }

  void _onActivity(ActivityEvent activity) {
    if (activity.type == ActivityType.WALKING) {
      // Additional logic can be implemented if needed
    }
  }

  @override
  void onClose() {
    _stepCountStreamSubscription.cancel();
    _activityStreamSubscription.cancel();
    super.onClose();
  }
}
