import 'package:flutter/material.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_oee_monitoring.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_OEEMonitoring extends StatefulWidget {
  List<Chart_model_OEEMonitoring> dataChartOEEMonitoring;

  ChartComponent_OEEMonitoring({Key? key, required this.dataChartOEEMonitoring})
      : super(key: key);

  @override
  _ChartComponent_OEEMonitoringState createState() =>
      _ChartComponent_OEEMonitoringState();
}

class _ChartComponent_OEEMonitoringState
    extends State<ChartComponent_OEEMonitoring> {
  late TooltipBehavior _tooltipBehavior;

  final List<Color> _colorLegend = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.brown,
    Colors.grey
  ];

  @override
  void initState() {
    // TODO: implement initState

    _tooltipBehavior = TooltipBehavior(
        tooltipPosition: TooltipPosition.pointer,
        enable: true,
        color: Colors.white,
        shared: true,
        builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
            int seriesIndex) {
          return FittedBox(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff636363).withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data!.months,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 10),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      widget.dataChartOEEMonitoring[0].value.length,
                      (i) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.dataChartOEEMonitoring[pointIndex]
                                      .value[i]['oee']
                                      .toString() !=
                                  "0"
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                  color: _colorLegend[i],
                                )
                              : Container(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          widget.dataChartOEEMonitoring[pointIndex]
                                      .value[i]['oee']
                                      .toString() !=
                                  "0"
                              ? Text(
                                  '${widget.dataChartOEEMonitoring[pointIndex].value[i]['tower']} : ',
                                  style: TextStyle(fontSize: 10))
                              : Container(),
                          widget.dataChartOEEMonitoring[pointIndex]
                                      .value[i]['oee']
                                      .toString() !=
                                  "0"
                              ? Text(
                                  widget.dataChartOEEMonitoring[pointIndex]
                                      .value[i]['oee']
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.52,
      padding: EdgeInsets.only(top: 20, left: 5, right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xff8A8A8A).withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      child: SfCartesianChart(
          primaryYAxis: NumericAxis(
            title: AxisTitle(text: 'Total'),
            name: 'aum',
            labelStyle: TextStyle(color: Colors.black),
            axisLine: AxisLine(width: 0),
            majorGridLines: MajorGridLines(
                width: 1,
                color: Colors.black.withOpacity(0.2),
                dashArray: <double>[5, 2]),
            majorTickLines: MajorTickLines(width: 0),
          ),
          primaryXAxis: CategoryAxis(
            labelStyle: TextStyle(color: Colors.black),
            interval: 1,
            majorGridLines: MajorGridLines(width: 0),
          ),
          tooltipBehavior: _tooltipBehavior,
          legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            orientation: LegendItemOrientation.horizontal,
          ),
          margin: EdgeInsets.zero,
          series: <CartesianSeries>[
            ColumnSeries<Chart_model_OEEMonitoring, String>(
                name: widget.dataChartOEEMonitoring[0].value[0]['tower'],
                color: _colorLegend[0],
                dataSource: widget.dataChartOEEMonitoring,
                xValueMapper: (Chart_model_OEEMonitoring exp, _) => exp.months,
                yValueMapper: (Chart_model_OEEMonitoring exp, _) =>
                    exp.value[0]['oee'],
                yAxisName: 'aum'),
            ColumnSeries<Chart_model_OEEMonitoring, String>(
                name: widget.dataChartOEEMonitoring[0].value[1]['tower'],
                color: _colorLegend[1],
                dataSource: widget.dataChartOEEMonitoring,
                xValueMapper: (Chart_model_OEEMonitoring exp, _) => exp.months,
                yValueMapper: (Chart_model_OEEMonitoring exp, _) =>
                    exp.value[1]['oee'],
                yAxisName: 'aum'),
          ]),
    );
  }
}
