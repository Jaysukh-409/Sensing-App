import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GyroSensor extends StatefulWidget {
  const GyroSensor({super.key});

  @override
  State<GyroSensor> createState() => _GyroSensorState();
}

class _GyroSensorState extends State<GyroSensor> {
  double x = 0, y = 0, z = 0;

  late List<LiveData> _chartData;
  late ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (mounted) {
        setState(() {
          x = event.x;
          y = event.y;
          z = event.z;
        });
      }
    });
    _chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), _updateDataSource);
    super.initState();
  }

  @override
  void dispose() {
    _chartSeriesController;
    _updateDataSource;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      backgroundColor: Colors.black,
      margin: const EdgeInsets.all(0),
      borderWidth: 0,
      borderColor: Colors.transparent,
      series: <LineSeries<LiveData, int>>[
        LineSeries<LiveData, int>(
          onRendererCreated: (ChartSeriesController controller) {
            _chartSeriesController = controller;
          },
          dataSource: _chartData,
          color: Colors.blue,
          xValueMapper: (LiveData sales, _) => sales.time,
          yValueMapper: (LiveData sales, _) => sales.z,
        ),
        LineSeries<LiveData, int>(
          onRendererCreated: (ChartSeriesController controller) {
            _chartSeriesController = controller;
          },
          dataSource: _chartData,
          color: Colors.green,
          xValueMapper: (LiveData sales, _) => sales.time,
          yValueMapper: (LiveData sales, _) => sales.y,
        ),
        LineSeries<LiveData, int>(
          onRendererCreated: (ChartSeriesController controller) {
            _chartSeriesController = controller;
          },
          dataSource: _chartData,
          color: Colors.red,
          xValueMapper: (LiveData sales, _) => sales.time,
          yValueMapper: (LiveData sales, _) => sales.x,
        )
      ],
      primaryXAxis: NumericAxis(
        borderWidth: 0,
        isVisible: false,
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        interval: 3,
      ),
      primaryYAxis: NumericAxis(
        borderWidth: 0,
        axisLine: const AxisLine(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
      ),
    );
  }

  int time = 19;
  void _updateDataSource(Timer timer) {
    _chartData.add(LiveData(time++, x, y, z));
    _chartData.removeAt(0);
    if (mounted) {
      _chartSeriesController.updateDataSource(
        addedDataIndex: _chartData.length - 1,
        removedDataIndex: 0,
      );
    }
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 0, 0, 0),
      LiveData(1, 0, 0, 0),
      LiveData(2, 0, 0, 0),
      LiveData(3, 0, 0, 0),
      LiveData(4, 0, 0, 0),
      LiveData(5, 0, 0, 0),
      LiveData(6, 0, 0, 0),
      LiveData(7, 0, 0, 0),
      LiveData(8, 0, 0, 0),
      LiveData(9, 0, 0, 0),
      LiveData(10, 0, 0, 0),
      LiveData(11, 0, 0, 0),
      LiveData(12, 0, 0, 0),
      LiveData(13, 0, 0, 0),
      LiveData(14, 0, 0, 0),
      LiveData(15, 0, 0, 0),
      LiveData(16, 0, 0, 0),
      LiveData(17, 0, 0, 0),
      LiveData(18, 0, 0, 0),
    ];
  }
}

class LiveData {
  LiveData(this.time, this.x, this.y, this.z);
  final int time;
  final num x;
  final num y;
  final num z;
}
