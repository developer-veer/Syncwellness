import 'package:get/get.dart';
import 'package:flutter_activity_recognition/flutter_activity_recognition.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

class RunningController extends GetxController {
  var isTracking = false.obs;
  var activityType = ActivityType.UNKNOWN.obs;
  var stepsCount = 0.obs;
  var distanceRun = 0.0.obs; // distance in kilometers

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
    distanceRun.value = 0.0;

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
    stepsCount.value = event.steps;

    const double stepLengthRunning = 1.0; // Average step length for running in meters

    if (activityType.value == ActivityType.RUNNING) {
      distanceRun.value = (stepsCount.value * stepLengthRunning) / 1000; // Convert meters to kilometers
      print("Distance run: ${distanceRun.value} km");
    } else {
      print("Current activity type is not running: ${activityType.value}");
    }
  }

  void _onActivity(Activity activity) {
    print("Activity event received: ${activity.type}");
    if (activity.type == ActivityType.RUNNING) {
      activityType.value = activity.type;
    } else {
      activityType.value = ActivityType.UNKNOWN;
    }

    if (activity.type == ActivityType.RUNNING) {
      // Resume step counting when running
      if (_stepCountStreamSubscription?.isPaused ?? false) {
        _stepCountStreamSubscription?.resume();
        print("Step count stream resumed.");
      }
    } else {
      // Pause step counting when not running
      _stepCountStreamSubscription?.pause();
      print("Step count stream paused.");
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
