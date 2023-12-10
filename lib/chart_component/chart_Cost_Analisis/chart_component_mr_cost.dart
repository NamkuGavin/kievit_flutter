import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_oee_journey.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_primary_and_breakdown_stopped.dart';
import 'package:kievit_flutter/model/model%20Cost%20Analysis/chart_model_cost_drivers.dart';
import 'package:kievit_flutter/model/model%20Cost%20Analysis/chart_model_mr_cost.dart';
import 'package:kievit_flutter/model/model%20Cost%20Analysis/chart_model_mr_order.dart';
import 'package:kievit_flutter/model/model%20Loss%20Analysis/chart_model_top10_downtime_dtmonitoring.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_daily_downtime.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_supplyfailure_technicalfailurearea.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_weekly_downtime.dart';
import 'package:kievit_flutter/model/model%20Planning%20Schedule/chart_model_planning_review.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_MR_Cost extends StatefulWidget {
  final List<MRCostPerZonePicData> dataChartMrCost;

  ChartComponent_MR_Cost({
    Key? key,
    required this.dataChartMrCost,
  }) : super(key: key);

  @override
  _ChartComponent_MR_CostState createState() => _ChartComponent_MR_CostState();
}

class _ChartComponent_MR_CostState extends State<ChartComponent_MR_Cost> {
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
                        color: Color(0xff8A8A8A).withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data!.month,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.dataChartMrCost[pointIndex].detail.calOrder !=
                                "0.0"
                            ? Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                    color: _colorLegend[0],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Cal_Order : ',
                                      style: TextStyle(fontSize: 8)),
                                  Text(
                                    widget.dataChartMrCost[pointIndex].detail
                                        .calOrder,
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            : Container(),
                        widget.dataChartMrCost[pointIndex].detail.pmOrder !=
                                "0.0"
                            ? Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                    color: _colorLegend[1],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('PM_Order : ',
                                      style: TextStyle(fontSize: 8)),
                                  Text(
                                    widget.dataChartMrCost[pointIndex].detail
                                        .pmOrder,
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            : Container(),
                        widget.dataChartMrCost[pointIndex].detail.cmOrder !=
                                "0.0"
                            ? Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                    color: _colorLegend[7],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('CM_Order : ',
                                      style: TextStyle(fontSize: 8)),
                                  Text(
                                    widget.dataChartMrCost[pointIndex].detail
                                        .cmOrder,
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            : Container(),
                        widget.dataChartMrCost[pointIndex].detail.bdOrder !=
                                "0.0"
                            ? Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                    color: _colorLegend[3],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('BD_Order : ',
                                      style: TextStyle(fontSize: 8)),
                                  Text(
                                    widget.dataChartMrCost[pointIndex].detail
                                        .bdOrder,
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            : Container(),
                        widget.dataChartMrCost[pointIndex].detail.modOrder !=
                                "0.0"
                            ? Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                    color: _colorLegend[2],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Mod_Order : ',
                                      style: TextStyle(fontSize: 8)),
                                  Text(
                                    widget.dataChartMrCost[pointIndex].detail
                                        .modOrder,
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            : Container(),
                      ])
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
          primaryYAxis: NumericAxis(
            numberFormat: NumberFormat.simpleCurrency(),
            labelStyle: TextStyle(color: Colors.black),
            axisLine: AxisLine(width: 0),
            majorGridLines: MajorGridLines(
                width: 1,
                color: Colors.black.withOpacity(0.2),
                dashArray: <double>[5, 2]),
            majorTickLines: MajorTickLines(width: 0),
          ),
          primaryXAxis: CategoryAxis(
            labelStyle: TextStyle(color: Colors.black, fontSize: 12),
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
            StackedColumnSeries<MRCostPerZonePicData, String>(
                name: "Cal_Order",
                color: _colorLegend[0],
                dataSource: widget.dataChartMrCost,
                xValueMapper: (MRCostPerZonePicData exp, _) => exp.month,
                yValueMapper: (MRCostPerZonePicData exp, _) =>
                    double.parse(exp.detail.calOrder)),
            StackedColumnSeries<MRCostPerZonePicData, String>(
                name: "PM_Order",
                color: _colorLegend[1],
                dataSource: widget.dataChartMrCost,
                xValueMapper: (MRCostPerZonePicData exp, _) => exp.month,
                yValueMapper: (MRCostPerZonePicData exp, _) =>
                    double.parse(exp.detail.pmOrder)),
            StackedColumnSeries<MRCostPerZonePicData, String>(
                name: "CM_Order",
                color: _colorLegend[7],
                dataSource: widget.dataChartMrCost,
                xValueMapper: (MRCostPerZonePicData exp, _) => exp.month,
                yValueMapper: (MRCostPerZonePicData exp, _) =>
                    double.parse(exp.detail.cmOrder)),
            StackedColumnSeries<MRCostPerZonePicData, String>(
                name: "BD_Order",
                color: _colorLegend[3],
                dataSource: widget.dataChartMrCost,
                xValueMapper: (MRCostPerZonePicData exp, _) => exp.month,
                yValueMapper: (MRCostPerZonePicData exp, _) =>
                    double.parse(exp.detail.bdOrder)),
            StackedColumnSeries<MRCostPerZonePicData, String>(
                name: "Mod_Order",
                color: _colorLegend[2],
                dataSource: widget.dataChartMrCost,
                xValueMapper: (MRCostPerZonePicData exp, _) => exp.month,
                yValueMapper: (MRCostPerZonePicData exp, _) =>
                    double.parse(exp.detail.modOrder)),
          ]),
    );
  }
}
