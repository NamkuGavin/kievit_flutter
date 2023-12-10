import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_oee_journey.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_primary_and_breakdown_stopped.dart';
import 'package:kievit_flutter/model/model%20Planning%20Schedule/chart_model_finished_ontime.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_FinishedOntime extends StatefulWidget {
  List<FinishedOntimeChart> dataChartFinishPM;
  List<FinishedOntimeChart> dataChartOntime;
  List<FinishedOntimeData> dataChartFinishedOnTime;

  ChartComponent_FinishedOntime(
      {Key? key,
      required this.dataChartFinishPM,
      required this.dataChartFinishedOnTime,
      required this.dataChartOntime})
      : super(key: key);

  @override
  _ChartComponent_FinishedOntimeState createState() =>
      _ChartComponent_FinishedOntimeState();
}

class _ChartComponent_FinishedOntimeState
    extends State<ChartComponent_FinishedOntime> {
  late TooltipBehavior _tooltipBehaviorFinishPM;
  late TooltipBehavior _tooltipBehaviorOnTime;

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

    _tooltipBehaviorFinishPM = TooltipBehavior(
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
                        color: Color(0xff8A8A8A).withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data!.week,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 8),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.dataChartFinishPM[pointIndex].detail!
                                    .countontime !=
                                "0"
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Count On Time : ',
                                      style: TextStyle(fontSize: 8)),
                                  Text(
                                    widget.dataChartFinishPM[pointIndex].detail!
                                        .countontime,
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            : Container(),
                        widget.dataChartFinishPM[pointIndex].detail!
                                    .sumontime !=
                                0
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                    color: Colors.orange,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Sum On Time : ',
                                      style: TextStyle(fontSize: 8)),
                                  Text(
                                    widget.dataChartFinishPM[pointIndex].detail!
                                        .sumontime
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            : Container(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.02,
                              width: MediaQuery.of(context).size.width * 0.01,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Accuracy : ', style: TextStyle(fontSize: 8)),
                            Text(
                              (widget.dataChartFinishPM[pointIndex].detail!
                                              .accuracy *
                                          100)
                                      .toInt()
                                      .toString() +
                                  "%",
                              style: TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ]),
                ],
              ),
            ),
          );
        });
    _tooltipBehaviorOnTime = TooltipBehavior(
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
                        color: Color(0xff8A8A8A).withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "% OnTime",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 11),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.02,
                              width: MediaQuery.of(context).size.width * 0.01,
                              color: Colors.orange,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Total : ', style: TextStyle(fontSize: 11)),
                            Text(
                              (widget.dataChartOntime[pointIndex].accuracy *
                                          100)
                                      .toInt()
                                      .toString() +
                                  "%",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ]),
                ],
              ),
            ),
          );
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
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
              title: ChartTitle(
                  text: widget.dataChartFinishedOnTime[0].series,
                  textStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              primaryYAxis: NumericAxis(
                name: 'aum',
                labelStyle: TextStyle(color: Colors.black),
                axisLine: AxisLine(width: 0),
                majorGridLines: MajorGridLines(
                    width: 0,
                    color: Colors.black.withOpacity(0.2),
                    dashArray: <double>[5, 2]),
                majorTickLines: MajorTickLines(width: 0),
              ),
              primaryXAxis: CategoryAxis(
                labelRotation: -90,
                labelStyle: TextStyle(color: Colors.black, fontSize: 8),
                interval: 2,
                majorGridLines: MajorGridLines(width: 0),
              ),
              axes: <ChartAxis>[
                NumericAxis(
                    numberFormat: NumberFormat.percentPattern(),
                    interval: 0.25,
                    labelStyle: TextStyle(color: Colors.black),
                    axisLine: AxisLine(width: 0),
                    // majorGridLines: MajorGridLines(
                    //     width: 0,
                    //     color: Colors.black.withOpacity(0.2),
                    //     dashArray: <double>[5, 2]),
                    majorTickLines: MajorTickLines(width: 0),
                    name: 'accuracy',
                    opposedPosition: true),
              ],
              tooltipBehavior: _tooltipBehaviorFinishPM,
              margin: EdgeInsets.zero,
              series: <CartesianSeries>[
                LineSeries<FinishedOntimeChart, String>(
                    // markerSettings:
                    // MarkerSettings(isVisible: true, width: 4, height: 4),
                    color: Colors.red,
                    dataSource: widget.dataChartFinishPM,
                    xValueMapper: (FinishedOntimeChart exp, _) => exp.week,
                    yValueMapper: (FinishedOntimeChart exp, _) =>
                    exp.detail!.accuracy,
                    yAxisName: 'accuracy',
                    enableTooltip: false),
                ColumnSeries<FinishedOntimeChart, String>(
                    color: Colors.blue,
                    dataSource: widget.dataChartFinishPM,
                    xValueMapper: (FinishedOntimeChart exp, _) => exp.week,
                    yValueMapper: (FinishedOntimeChart exp, _) =>
                        int.parse(exp.detail!.countontime),
                    yAxisName: 'aum'),
                ColumnSeries<FinishedOntimeChart, String>(
                    color: Colors.orange,
                    dataSource: widget.dataChartFinishPM,
                    xValueMapper: (FinishedOntimeChart exp, _) => exp.week,
                    yValueMapper: (FinishedOntimeChart exp, _) =>
                        exp.detail!.sumontime,
                    yAxisName: 'aum'),
              ]),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.1,
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
              title: ChartTitle(
                  text: widget.dataChartFinishedOnTime[1].series,
                  textStyle:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              primaryYAxis: NumericAxis(isVisible: false),
              primaryXAxis: CategoryAxis(
                labelStyle: TextStyle(color: Colors.black),
                interval: 1,
                majorGridLines: MajorGridLines(width: 0),
              ),
              tooltipBehavior: _tooltipBehaviorOnTime,
              margin: EdgeInsets.zero,
              series: <CartesianSeries>[
                ColumnSeries<FinishedOntimeChart, String>(
                    dataLabelSettings: DataLabelSettings(
                        textStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        labelAlignment: ChartDataLabelAlignment.top,
                        useSeriesColor: true,
                        showZeroValue: false,
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.inside),
                    color: Colors.orange,
                    dataSource: widget.dataChartOntime,
                    dataLabelMapper: (FinishedOntimeChart exp, _) =>
                        (exp.accuracy * 100).toInt().toString() + "%",
                    xValueMapper: (FinishedOntimeChart exp, _) => "Total",
                    yValueMapper: (FinishedOntimeChart exp, _) =>
                        (exp.accuracy * 100).toInt()),
              ]),
        ),
      ],
    );
  }
}
