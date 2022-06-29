import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MiniChartBuilder extends StatelessWidget {
  const MiniChartBuilder({Key? key, required List<List<num>> chartData})
      : _chartData = chartData,
        super(key: key);
  final List<List<num>> _chartData;

  @override
  Widget build(BuildContext context) {
    List<List<num>> chartData = _createListWithChartData(_chartData);
    return SizedBox(
        height: double.infinity,
        child: chartData.isNotEmpty
            ? SfCartesianChart(
                margin: EdgeInsets.zero,
                tooltipBehavior: TooltipBehavior(enable: false),
                borderColor: Colors.transparent,
                plotAreaBorderWidth: 0,
                primaryXAxis: NumericAxis(
                  axisBorderType: AxisBorderType.withoutTopAndBottom,
                  axisLine: const AxisLine(width: 0),
                  isVisible: false,
                  borderWidth: 0,
                  majorGridLines: const MajorGridLines(
                    width: 0,
                  ),
                  minorGridLines: const MinorGridLines(
                    width: 0,
                  ),
                  majorTickLines: const MajorTickLines(
                    size: 0,
                    width: 0,
                  ),
                  minorTickLines: const MinorTickLines(
                    size: 0,
                    width: 0,
                  ),
                ),
                primaryYAxis: NumericAxis(
                    axisLine: const AxisLine(width: 0),
                    axisBorderType: AxisBorderType.withoutTopAndBottom,
                    minimum: countBorderPrice(false).toDouble(),
                    maximum: countBorderPrice(true).toDouble(),
                    borderWidth: 0,
                    borderColor: Colors.deepOrange,
                    majorGridLines: const MajorGridLines(
                      width: 0,
                    ),
                    minorGridLines: const MinorGridLines(
                      width: 0,
                    ),
                    majorTickLines: const MajorTickLines(
                      size: 0,
                      width: 0,
                    ),
                    minorTickLines: const MinorTickLines(
                      size: 0,
                      width: 0,
                    ),
                    isVisible: false),
                borderWidth: 0,
                series: <ChartSeries>[
                    // Renders line chart
                    LineSeries<List<num>, num>(
                        dataSource: chartData,
                        xValueMapper: (List<num> data, _) => data.first,
                        yValueMapper: (List<num> data, _) => data.last)
                  ])
            : const SizedBox.shrink());
  }

  List<List<num>> _createListWithChartData(List<List<num>> chartData) {
    List<List<num>> newChartData = [];
    for (int i = 0; i < chartData.length; i++) {
      if (i % 6 == 0) {
        newChartData.add(chartData[i]);
      }
    }

    return newChartData;
  }

  num countBorderPrice(bool isMax) {
    List<num> numbers = [];
    for (var element in _createListWithChartData(_chartData)) {
      numbers.add(element.last);
    }

    if (isMax) {
      return numbers.reduce((curr, next) => curr > next ? curr : next);
    } else {
      return numbers.reduce((curr, next) => curr < next ? curr : next);
    }
  }
}
