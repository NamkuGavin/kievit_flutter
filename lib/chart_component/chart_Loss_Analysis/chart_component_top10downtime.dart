import 'package:flutter/material.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_oee_journey.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_primary_and_breakdown_stopped.dart';
import 'package:kievit_flutter/model/model%20Loss%20Analysis/chart_model_top10_downtime_dtmonitoring.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_daily_downtime.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_supplyfailure_technicalfailurearea.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_weekly_downtime.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_Top10Downtime extends StatefulWidget {
  List<Chart_model_Top10Downtime_DTMonitoring>
      dataChartTop10Downtime_DTMonitoring;

  ChartComponent_Top10Downtime(
      {Key? key, required this.dataChartTop10Downtime_DTMonitoring})
      : super(key: key);

  @override
  _ChartComponent_Top10DowntimeState createState() =>
      _ChartComponent_Top10DowntimeState();
}

class _ChartComponent_Top10DowntimeState
    extends State<ChartComponent_Top10Downtime> {
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
          return Container(
            height: MediaQuery.of(context).size.height * 0.19,
            width: MediaQuery.of(context).size.width * 0.17,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data!.names,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 7),
                ),
                Container(
                  color: Color(0xffD1D5DB),
                  height: 1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Column(
                  children: List.generate(
                    widget.dataChartTop10Downtime_DTMonitoring[0].detail.length,
                    (i) => Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.02,
                          width: MediaQuery.of(context).size.width * 0.01,
                          color: _colorLegend[i],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                            '${widget.dataChartTop10Downtime_DTMonitoring[pointIndex].detail[i]['category']} : ',
                            style: TextStyle(fontSize: 8)),
                        Text(
                          widget.dataChartTop10Downtime_DTMonitoring[pointIndex]
                              .detail[i]['value']
                              .toString(),
                          style: TextStyle(
                              fontSize: 8, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                )
              ],
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
          isTransposed: true,
          primaryYAxis: NumericAxis(
            labelStyle: TextStyle(color: Colors.black),
            axisLine: AxisLine(width: 0),
            majorGridLines: MajorGridLines(
                width: 1,
                color: Colors.black.withOpacity(0.2),
                dashArray: <double>[5, 2]),
            majorTickLines: MajorTickLines(width: 0),
          ),
          primaryXAxis: CategoryAxis(
            isInversed: true,
            labelStyle: TextStyle(color: Colors.black, fontSize: 9),
            interval: 1,
            majorGridLines: MajorGridLines(width: 0),
          ),
          tooltipBehavior: _tooltipBehavior,
          legend: Legend(
            isVisible: true,
          ),
          margin: EdgeInsets.zero,
          series: <CartesianSeries>[
            StackedColumnSeries<Chart_model_Top10Downtime_DTMonitoring, String>(
                name: widget.dataChartTop10Downtime_DTMonitoring[0].detail[0]
                    ['category'],
                dataSource: widget.dataChartTop10Downtime_DTMonitoring,
                color: _colorLegend[0],
                xValueMapper: (Chart_model_Top10Downtime_DTMonitoring exp, _) =>
                    exp.names,
                yValueMapper: (Chart_model_Top10Downtime_DTMonitoring exp, _) =>
                    exp.detail[0]['value']),
            SplineSeries<Chart_model_Top10Downtime_DTMonitoring, String>(
                dataLabelSettings: DataLabelSettings(
                  offset: Offset(15,0),
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.middle,
                    textStyle: TextStyle(
                      fontSize: 9,
                    )),
                name: widget.dataChartTop10Downtime_DTMonitoring[0].detail[1]
                    ['category'],
                color: Colors.green,
                markerSettings: MarkerSettings(
                  width: 7,
                  height: 7,
                  isVisible: true,
                ),
                dataSource: widget.dataChartTop10Downtime_DTMonitoring,
                xValueMapper: (Chart_model_Top10Downtime_DTMonitoring exp, _) =>
                    exp.names,
                yValueMapper: (Chart_model_Top10Downtime_DTMonitoring exp, _) =>
                    exp.detail[1]['value'],
                enableTooltip: false),
          ]),
    );
  }
}
