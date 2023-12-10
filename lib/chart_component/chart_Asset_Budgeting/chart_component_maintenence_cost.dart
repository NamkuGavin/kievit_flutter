import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:kievit_flutter/model/model%20Asset%20Budgeting/chart_model_maintenence_cost.dart';
import 'package:kievit_flutter/model/model%20Job%20Execution/chart_model_backlog_week.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_MaintenenceCost extends StatefulWidget {
  final List<AssetCostBudgetingChart> dataChartMaintenenceCost;
  ChartComponent_MaintenenceCost({
    Key? key,
    required this.dataChartMaintenenceCost,
  }) : super(key: key);

  @override
  _ChartComponent_MaintenenceCostState createState() =>
      _ChartComponent_MaintenenceCostState();
}

class _ChartComponent_MaintenenceCostState
    extends State<ChartComponent_MaintenenceCost> {
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data!.month,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.dataChartMaintenenceCost[pointIndex].detail
                                      .partcost !=
                                  0
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                  color: _colorLegend[7],
                                )
                              : Container(),
                          SizedBox(
                            width: 5,
                          ),
                          widget.dataChartMaintenenceCost[pointIndex].detail
                                      .partcost !=
                                  0
                              ? Text('Sp_Part2022 : ',
                                  style: TextStyle(fontSize: 8))
                              : Container(),
                          widget.dataChartMaintenenceCost[pointIndex].detail
                                      .partcost !=
                                  0
                              ? Text(
                                  widget.dataChartMaintenenceCost[pointIndex]
                                      .detail.partcost
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.w600),
                                )
                              : Container(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.dataChartMaintenenceCost[pointIndex].detail
                                      .servicecost !=
                                  0
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                  color: _colorLegend[3],
                                )
                              : Container(),
                          SizedBox(
                            width: 5,
                          ),
                          widget.dataChartMaintenenceCost[pointIndex].detail
                                      .servicecost !=
                                  0
                              ? Text('Servises2022 : ',
                                  style: TextStyle(fontSize: 8))
                              : Container(),
                          widget.dataChartMaintenenceCost[pointIndex].detail
                                      .servicecost !=
                                  0
                              ? Text(
                                  widget.dataChartMaintenenceCost[pointIndex]
                                      .detail.servicecost
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.w600),
                                )
                              : Container(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.dataChartMaintenenceCost[pointIndex].detail
                                      .budget !=
                                  0
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                  color: HexColor("#7166F9"),
                                )
                              : Container(),
                          SizedBox(
                            width: 5,
                          ),
                          widget.dataChartMaintenenceCost[pointIndex].detail
                                      .budget !=
                                  0
                              ? Text('B2022 : ', style: TextStyle(fontSize: 8))
                              : Container(),
                          widget.dataChartMaintenenceCost[pointIndex].detail
                                      .budget !=
                                  0
                              ? Text(
                                  widget.dataChartMaintenenceCost[pointIndex]
                                      .detail.budget
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.w600),
                                )
                              : Container(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.dataChartMaintenenceCost[pointIndex].detail
                                      .cost !=
                                  0
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                  color: _colorLegend[5],
                                )
                              : Container(),
                          SizedBox(
                            width: 5,
                          ),
                          widget.dataChartMaintenenceCost[pointIndex].detail
                                      .cost !=
                                  0
                              ? Text('A2022 : ', style: TextStyle(fontSize: 8))
                              : Container(),
                          widget.dataChartMaintenenceCost[pointIndex].detail
                                      .cost !=
                                  0
                              ? Text(
                                  widget.dataChartMaintenenceCost[pointIndex]
                                      .detail.cost
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.w600),
                                )
                              : Container(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.dataChartMaintenenceCost[pointIndex].detail
                                      .ytd !=
                                  0
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                  color: _colorLegend[4],
                                )
                              : Container(),
                          SizedBox(
                            width: 5,
                          ),
                          widget.dataChartMaintenenceCost[pointIndex].detail
                                      .ytd !=
                                  0
                              ? Text('%YTD : ', style: TextStyle(fontSize: 8))
                              : Container(),
                          widget.dataChartMaintenenceCost[pointIndex].detail
                                      .ytd !=
                                  0
                              ? Text(
                                  (widget.dataChartMaintenenceCost[pointIndex]
                                                  .detail.ytd *
                                              100)
                                          .toInt()
                                          .toString() +
                                      "%",
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.w600),
                                )
                              : Container(),
                        ],
                      ),
                    ],
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
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.52,
      padding: EdgeInsets.only(top: 20, left: 5, right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xff8A8A8A).withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      child: SfCartesianChart(
          zoomPanBehavior: ZoomPanBehavior(
            enablePinching: true,
            zoomMode: ZoomMode.x,
            enablePanning: true,
          ),
          primaryYAxis: NumericAxis(
            interval: 50,
            name: 'aum',
            labelStyle: TextStyle(color: Colors.black),
            axisLine: AxisLine(color: Colors.white),
            majorGridLines: MajorGridLines(
                width: 0.5, color: Colors.black.withOpacity(0.2)),
            majorTickLines: MajorTickLines(width: 0),
          ),
          primaryXAxis: CategoryAxis(
            labelStyle: TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
            majorGridLines: MajorGridLines(width: 0),
          ),
          axes: <ChartAxis>[
            NumericAxis(
                numberFormat: NumberFormat.percentPattern(),
                maximum: 1.2,
                interval: 0.1,
                labelStyle: TextStyle(color: Colors.white),
                axisLine: AxisLine(color: Colors.white),
                majorGridLines: MajorGridLines(
                    width: 0,
                    color: Colors.black.withOpacity(0.2),
                    dashArray: <double>[5, 2]),
                majorTickLines: MajorTickLines(width: 0),
                name: 'accuracy',
                opposedPosition: true),
          ],
          tooltipBehavior: _tooltipBehavior,
          legend: Legend(
            textStyle: TextStyle(fontSize: 12),
            isVisible: true,
            position: LegendPosition.bottom,
            orientation: LegendItemOrientation.horizontal,
          ),
          margin: EdgeInsets.zero,
          series: <CartesianSeries>[
            StackedColumnSeries<AssetCostBudgetingChart, String>(
                name: "Sp_Part2022",
                color: _colorLegend[7],
                dataSource: widget.dataChartMaintenenceCost,
                xValueMapper: (AssetCostBudgetingChart exp, _) => exp.month,
                yValueMapper: (AssetCostBudgetingChart exp, _) =>
                    exp.detail.partcost,
                yAxisName: 'aum'),
            StackedColumnSeries<AssetCostBudgetingChart, String>(
                name: "Servises2022",
                color: _colorLegend[3],
                dataSource: widget.dataChartMaintenenceCost,
                xValueMapper: (AssetCostBudgetingChart exp, _) => exp.month,
                yValueMapper: (AssetCostBudgetingChart exp, _) =>
                    exp.detail.servicecost,
                yAxisName: 'aum'),
            LineSeries<AssetCostBudgetingChart, String>(
                name: "B2022",
                dataSource: widget.dataChartMaintenenceCost,
                dashArray: <double>[10, 5],
                color: Colors.red,
                xValueMapper: (AssetCostBudgetingChart exp, _) => exp.month,
                yValueMapper: (AssetCostBudgetingChart exp, _) =>
                    exp.detail.budget,
                yAxisName: 'aum',
                enableTooltip: false),
            LineSeries<AssetCostBudgetingChart, String>(
                name: "A2022",
                dataSource: widget.dataChartMaintenenceCost,
                color: Colors.green,
                xValueMapper: (AssetCostBudgetingChart exp, _) => exp.month,
                yValueMapper: (AssetCostBudgetingChart exp, _) =>
                    exp.detail.cost,
                yAxisName: 'aum',
                enableTooltip: false),
            SplineSeries<AssetCostBudgetingChart, String>(
                dataLabelSettings: DataLabelSettings(
                    color: Colors.white,
                    textStyle: TextStyle(fontSize: 10),
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.top),
                name: "%YTD",
                dataSource: widget.dataChartMaintenenceCost,
                color: Color(0xFF1821FF),
                xValueMapper: (AssetCostBudgetingChart exp, _) => exp.month,
                yValueMapper: (AssetCostBudgetingChart exp, _) =>
                    exp.detail.ytd,
                yAxisName: 'accuracy',
                enableTooltip: false),
          ]),
    );
  }
}
