import 'package:flutter/material.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_oee_journey.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_primary_and_breakdown_stopped.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_daily_downtime.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_supplyfailure_technicalfailurearea.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_weekly_downtime.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_DailyDowntime extends StatefulWidget {
  List<Chart_model_DailyDowntime> dataChartDailyDowntime;

  ChartComponent_DailyDowntime({Key? key, required this.dataChartDailyDowntime})
      : super(key: key);

  @override
  _ChartComponent_DailyDowntimeState createState() =>
      _ChartComponent_DailyDowntimeState();
}

class _ChartComponent_DailyDowntimeState
    extends State<ChartComponent_DailyDowntime> {
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

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
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );
    _tooltipBehavior = TooltipBehavior(
        elevation: 2,
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
                    data!.days.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 8),
                  ),
                  Container(
                    color: Color(0xffD1D5DB),
                    height: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      widget.dataChartDailyDowntime[0].detail.length,
                      (i) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.dataChartDailyDowntime[pointIndex]
                                      .detail[i]['value']
                                      .toString() !=
                                  "0"
                              ? Container(
                                  height: 5,
                                  width: 5,
                                  color: _colorLegend[i],
                                )
                              : Container(),
                          SizedBox(
                            width: 5,
                          ),
                          widget.dataChartDailyDowntime[pointIndex]
                                      .detail[i]['value']
                                      .toString() !=
                                  "0"
                              ? Text(
                                  '${widget.dataChartDailyDowntime[pointIndex].detail[i]['zone']} : ',
                                  style: TextStyle(fontSize: 8))
                              : Container(),
                          widget.dataChartDailyDowntime[pointIndex]
                                      .detail[i]['value']
                                      .toString() !=
                                  "0"
                              ? Text(
                                  widget.dataChartDailyDowntime[pointIndex]
                                      .detail[i]['value']
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.w600),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Total : " + data!.totals.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 8),
                  ),
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
              autoScrollingDelta: 16,
              autoScrollingMode: AutoScrollingMode.start
          ),
          axes: <ChartAxis>[
            NumericAxis(
                title: AxisTitle(text: 'All Total Stop'),
                labelStyle: const TextStyle(color: Colors.black),
                axisLine: const AxisLine(width: 0),
                majorGridLines: MajorGridLines(
                    width: 1,
                    color: Colors.black.withOpacity(0.2),
                    dashArray: const <double>[5, 2]),
                majorTickLines: const MajorTickLines(width: 0),
                name: 'units',
                opposedPosition: true),
          ],
          zoomPanBehavior: _zoomPanBehavior,
          tooltipBehavior: _tooltipBehavior,
          legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            orientation: LegendItemOrientation.horizontal,
          ),
          margin: EdgeInsets.zero,
          series: <CartesianSeries>[
            StackedColumnSeries<Chart_model_DailyDowntime, String>(
                name: widget.dataChartDailyDowntime[0].detail[0]['zone'],
                color: _colorLegend[0],
                dataSource: widget.dataChartDailyDowntime,
                xValueMapper: (Chart_model_DailyDowntime exp, _) =>
                    exp.days.toString(),
                yValueMapper: (Chart_model_DailyDowntime exp, _) =>
                    exp.detail[0]['value'],
                yAxisName: 'aum'),
            StackedColumnSeries<Chart_model_DailyDowntime, String>(
                name: widget.dataChartDailyDowntime[0].detail[1]['zone'],
                color: _colorLegend[1],
                dataSource: widget.dataChartDailyDowntime,
                xValueMapper: (Chart_model_DailyDowntime exp, _) =>
                    exp.days.toString(),
                yValueMapper: (Chart_model_DailyDowntime exp, _) =>
                    exp.detail[1]['value'],
                yAxisName: 'aum'),
            StackedColumnSeries<Chart_model_DailyDowntime, String>(
                name: widget.dataChartDailyDowntime[0].detail[2]['zone'],
                color: _colorLegend[2],
                dataSource: widget.dataChartDailyDowntime,
                xValueMapper: (Chart_model_DailyDowntime exp, _) =>
                    exp.days.toString(),
                yValueMapper: (Chart_model_DailyDowntime exp, _) =>
                    exp.detail[2]['value'],
                yAxisName: 'aum'),
            StackedColumnSeries<Chart_model_DailyDowntime, String>(
                name: widget.dataChartDailyDowntime[0].detail[3]['zone'],
                color: _colorLegend[3],
                dataSource: widget.dataChartDailyDowntime,
                xValueMapper: (Chart_model_DailyDowntime exp, _) =>
                    exp.days.toString(),
                yValueMapper: (Chart_model_DailyDowntime exp, _) =>
                    exp.detail[3]['value'],
                yAxisName: 'aum'),
            StackedColumnSeries<Chart_model_DailyDowntime, String>(
                name: widget.dataChartDailyDowntime[0].detail[4]['zone'],
                color: _colorLegend[4],
                dataSource: widget.dataChartDailyDowntime,
                xValueMapper: (Chart_model_DailyDowntime exp, _) =>
                    exp.days.toString(),
                yValueMapper: (Chart_model_DailyDowntime exp, _) =>
                    exp.detail[4]['value'],
                yAxisName: 'aum'),
            SplineSeries<Chart_model_DailyDowntime, String>(
                dataLabelSettings: DataLabelSettings(
                    showZeroValue: false,
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.top,
                    textStyle: TextStyle(
                      fontSize: 9,
                    )),
                name: "Total",
                color: Colors.blue,
                markerSettings: MarkerSettings(
                  width: 5,
                  height: 5,
                  isVisible: true,
                ),
                dataSource: widget.dataChartDailyDowntime,
                xValueMapper: (Chart_model_DailyDowntime exp, _) =>
                    exp.days.toString(),
                yValueMapper: (Chart_model_DailyDowntime exp, _) => exp.totals,
                yAxisName: 'aum',
                enableTooltip: false),
          ]),
    );
  }
}
