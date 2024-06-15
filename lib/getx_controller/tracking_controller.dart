import 'package:get/get.dart';
import 'package:flutter_activity_recognition/flutter_activity_recognition.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

class TrackingController extends GetxController {
  var isTracking = false.obs;
  var activityType = 'UNKNOWN'.obs;
  var stepsCount = 0.obs;
  var distanceWalked = 0.0.obs; // distance in kilometers

  StreamSubscription<Activity>? _activityStreamSubscription;
  StreamSubscription<StepCount>? _stepCountStreamSubscription;

  @override
  void onInit() {
    super.onInit();
    requestPermissions().then((_) => _initializeActivityRecognition());
  }

  Future<void> requestPermissions() async {
    var activityRecognitionStatus = await Permission.activityRecognition.status;
    if (activityRecognitionStatus.isDenied) {
      await Permission.activityRecognition.request();
    }

    var sensorsStatus = await Permission.sensors.status;
    if (sensorsStatus.isDenied) {
      await Permission.sensors.request();
    }
  }

  Future<void> _initializeActivityRecognition() async {
    try {
      _activityStreamSubscription = FlutterActivityRecognition.instance.activityStream.listen(_onActivity);
      print('Activity recognition initialized.');
    } catch (e) {
      print('Error initializing activity recognition: $e');
    }
  }

  void startTracking() async {
    print("Starting tracking...");
    if (isTracking.value) return;

    isTracking.value = true;
    stepsCount.value = 0;
    distanceWalked.value = 0.0;

    try {
      _stepCountStreamSubscription = Pedometer.stepCountStream.listen(_onStepCount);
      print('Step count stream started.');
    } catch (e) {
      print('Error starting step count stream: $e');
      isTracking.value = false;
    }
  }

  void stopTracking() {
    print("Stopping tracking...");
    if (!isTracking.value) return;

    isTracking.value = false;
    _activityStreamSubscription?.cancel();
    _stepCountStreamSubscription?.cancel();
    print('Tracking stopped.');
  }

  void _onStepCount(StepCount event) {
    print("Step count event received: ${event.steps}");
    if (activityType.value == ActivityType.WALKING.toString()) {
      stepsCount.value = event.steps;

      // Assume an average step length of 0.75 meters
      const double stepLengthInMeters = 0.75;
      distanceWalked.value = (stepsCount.value * stepLengthInMeters) / 1000; // Convert meters to kilometers

      print("Distance walked: ${distanceWalked.value} km");
    } else {
      print("Current activity type is not walking: ${activityType.value}");
    }
  }

  void _onActivity(Activity activity) {
    print("Activity event received: ${activity.type}");
    activityType.value = activity.type.toString();
    if (activity.type != ActivityType.WALKING) {
      // Pause step counting when not walking
      _stepCountStreamSubscription?.pause();
      print("Step count stream paused.");
    } else {
      // Resume step counting when walking
      if (_stepCountStreamSubscription?.isPaused ?? false) {
        _stepCountStreamSubscription?.resume();
        print("Step count stream resumed.");
      }
    }
  }

  @override
  void onClose() {
    _activityStreamSubscription?.cancel();
    _stepCountStreamSubscription?.cancel();
    print('Tracking controller closed.');
    super.onClose();
  }
}
