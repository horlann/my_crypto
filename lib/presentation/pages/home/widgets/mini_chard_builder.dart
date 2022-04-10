import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MiniChartBuilder extends StatelessWidget {
  const MiniChartBuilder({Key? key, required this.chartData}) : super(key: key);
  final List<List<num>> chartData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        child: chartData.length != 0
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
            : SizedBox.shrink());
  }

  num countBorderPrice(bool isMax){
    List<num> numbers=[];
    chartData.forEach((element) {
      numbers.add(element.last);
    });

    if(isMax){
      return numbers.reduce((curr, next) => curr > next? curr: next);

    }else{
      return numbers.reduce((curr, next) => curr < next? curr: next);

    }
  }
}
