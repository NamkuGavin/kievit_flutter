import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:kievit_flutter/model/model%20Cost%20Analysis/chart_model_comparasion_order.dart';
import 'package:kievit_flutter/model/model%20Cost%20Analysis/chart_model_mr_cost.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_ComparasionOrder extends StatefulWidget {
  final List<ComparisonPmOrderVsCmOrderData> dataChartComparasionOrder;

  ChartComponent_ComparasionOrder({
    Key? key,
    required this.dataChartComparasionOrder,
  }) : super(key: key);

  @override
  _ChartComponent_ComparasionOrderState createState() =>
      _ChartComponent_ComparasionOrderState();
}

class _ChartComponent_ComparasionOrderState
    extends State<ChartComponent_ComparasionOrder> {
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
                        widget.dataChartComparasionOrder[pointIndex].detail
                                    .calOrder !=
                                "0.00"
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
                                    double.parse(widget
                                                .dataChartComparasionOrder[
                                                    pointIndex]
                                                .detail
                                                .calOrder)
                                            .ceil()
                                            .toInt()
                                            .toString() +
                                        "%",
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            : Container(),
                        widget.dataChartComparasionOrder[pointIndex].detail
                                    .pmOrder !=
                                "0.00"
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
                                    double.parse(widget
                                                .dataChartComparasionOrder[
                                                    pointIndex]
                                                .detail
                                                .pmOrder)
                                            .toInt()
                                            .toString() +
                                        "%",
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            : Container(),
                        widget.dataChartComparasionOrder[pointIndex].detail
                                    .cmOrder !=
                                "0.00"
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
                                    double.parse(widget
                                                .dataChartComparasionOrder[
                                                    pointIndex]
                                                .detail
                                                .cmOrder)
                                            .toInt()
                                            .toString() +
                                        "%",
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            : Container(),
                        widget.dataChartComparasionOrder[pointIndex].detail
                                    .bdOrder !=
                                "0.00"
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
                                    double.parse(widget
                                                .dataChartComparasionOrder[
                                                    pointIndex]
                                                .detail
                                                .bdOrder)
                                            .toInt()
                                            .toString() +
                                        "%",
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            : Container(),
                        widget.dataChartComparasionOrder[pointIndex].detail
                                    .modOrder !=
                                "0.00"
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
                                    double.parse(widget
                                                .dataChartComparasionOrder[
                                                    pointIndex]
                                                .detail
                                                .modOrder)
                                            .toInt()
                                            .toString() +
                                        "%",
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
            interval: 25,
            // minimum: -0.5,
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
            StackedColumnSeries<ComparisonPmOrderVsCmOrderData, String>(
                name: "Cal_Order",
                color: _colorLegend[0],
                dataSource: widget.dataChartComparasionOrder,
                xValueMapper: (ComparisonPmOrderVsCmOrderData exp, _) =>
                    exp.month,
                yValueMapper: (ComparisonPmOrderVsCmOrderData exp, _) =>
                    double.parse(exp.detail.calOrder)),
            StackedColumnSeries<ComparisonPmOrderVsCmOrderData, String>(
                name: "PM_Order",
                color: _colorLegend[1],
                dataSource: widget.dataChartComparasionOrder,
                xValueMapper: (ComparisonPmOrderVsCmOrderData exp, _) =>
                    exp.month,
                yValueMapper: (ComparisonPmOrderVsCmOrderData exp, _) =>
                    double.parse(exp.detail.pmOrder)),
            StackedColumnSeries<ComparisonPmOrderVsCmOrderData, String>(
                name: "CM_Order",
                color: _colorLegend[7],
                dataSource: widget.dataChartComparasionOrder,
                xValueMapper: (ComparisonPmOrderVsCmOrderData exp, _) =>
                    exp.month,
                yValueMapper: (ComparisonPmOrderVsCmOrderData exp, _) =>
                    double.parse(exp.detail.cmOrder)),
            StackedColumnSeries<ComparisonPmOrderVsCmOrderData, String>(
                name: "BD_Order",
                color: _colorLegend[3],
                dataSource: widget.dataChartComparasionOrder,
                xValueMapper: (ComparisonPmOrderVsCmOrderData exp, _) =>
                    exp.month,
                yValueMapper: (ComparisonPmOrderVsCmOrderData exp, _) =>
                    double.parse(exp.detail.bdOrder)),
            StackedColumnSeries<ComparisonPmOrderVsCmOrderData, String>(
                name: "Mod_Order",
                color: _colorLegend[2],
                dataSource: widget.dataChartComparasionOrder,
                xValueMapper: (ComparisonPmOrderVsCmOrderData exp, _) =>
                    exp.month,
                yValueMapper: (ComparisonPmOrderVsCmOrderData exp, _) =>
                    double.parse(exp.detail.modOrder)),
          ]),
    );
  }
}
