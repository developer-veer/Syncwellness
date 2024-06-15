import 'package:get/get.dart';
import 'package:flutter_activity_recognition/flutter_activity_recognition.dart';
import 'package:pedometer/pedometer.dart';
import 'dart:async';

class TrackingController extends GetxController {
  var isTracking = false.obs;
  var activityType = 'UNKNOWN'.obs;
  var stepsCount = 0.obs;
  var distanceWalked = 0.0.obs; // distance in kilometers

  late StreamSubscription<Activity> _activityStreamSubscription;
  late StreamSubscription<StepCount> _stepCountStreamSubscription;

  @override
  void onInit() {
    super.onInit();
    _initializeActivityRecognition();
  }

  void _initializeActivityRecognition() async {
    try {
      _activityStreamSubscription = FlutterActivityRecognition.instance.activityStream.listen(_onActivity);
    } catch (e) {
      print('Error initializing activity recognition: $e');
    }
  }

  void startTracking() async {
    print("here i get");
    if (isTracking.value) return;

    isTracking.value = true;
    stepsCount.value = 0;
    distanceWalked.value = 0.0;

    try {
      _stepCountStreamSubscription = Pedometer.stepCountStream.listen(_onStepCount);
    } catch (e) {
      print('Error starting step count stream: $e');
      isTracking.value = false;
    }
  }

  void stopTracking() {
    if (!isTracking.value) return;

    isTracking.value = false;
    _activityStreamSubscription.cancel();
    _stepCountStreamSubscription.cancel();
  }

  void _onStepCount(StepCount event) {
    if (activityType.value == ActivityType.WALKING.toString()) {
      stepsCount.value = event.steps;
      distanceWalked.value = (stepsCount.value * 0.8) / 1000; // Average step length in meters to kilometers
    }
  }

  void _onActivity(Activity activity) {
    activityType.value = activity.type.toString();
    if (activity.type != ActivityType.WALKING) {
      // Pause step counting when not walking
      _stepCountStreamSubscription.pause();
    } else {
      // Resume step counting when walking
      if (_stepCountStreamSubscription.isPaused) {
        _stepCountStreamSubscription.resume();
      }
    }
  }

  @override
  void onClose() {
    _activityStreamSubscription.cancel();
    _stepCountStreamSubscription.cancel();
    super.onClose();
  }
}
