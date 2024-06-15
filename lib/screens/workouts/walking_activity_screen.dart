import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx_controller/tracking_controller.dart';

class WalkingActivityScreen extends StatefulWidget {
  @override
  _WalkingActivityScreenState createState() => _WalkingActivityScreenState();
}

class _WalkingActivityScreenState extends State<WalkingActivityScreen> {
  final TrackingController _trackingController = Get.put(TrackingController());

  @override
  void initState() {
    super.initState();
    _trackingController.requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Walking Activity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Real-time Walking Distance:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Obx(() {
              return Text(
                '${_trackingController.distanceWalked.value.toStringAsFixed(2)} km',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _trackingController.startTracking();
              },
              child: Text('Start Tracking'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _trackingController.stopTracking();
              },
              child: Text('Stop Tracking'),
            ),
          ],
        ),
      ),
    );
  }
}
