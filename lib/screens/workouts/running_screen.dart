import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx_controller/running_controller.dart';


class RunningActivityScreen extends StatefulWidget {
  const RunningActivityScreen({super.key});

  @override
  _RunningActivityScreenState createState() => _RunningActivityScreenState();
}

class _RunningActivityScreenState extends State<RunningActivityScreen> {
  final RunningController _runningController = Get.put(RunningController());

  @override
  void initState() {
    super.initState();
    _runningController.requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Running Activity Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Real-time Running Distance:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Obx(() {
              return Text(
                '${_runningController.distanceRun.value.toStringAsFixed(2)} km',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _runningController.startTracking();
              },
              child: Text('Start Tracking'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _runningController.stopTracking();
              },
              child: Text('Stop Tracking'),
            ),
          ],
        ),
      ),
    );
  }
}
