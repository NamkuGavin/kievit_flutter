import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_oee_journey.dart';
import 'package:kievit_flutter/model/model%20Cost%20Registration/chart_model_actual_cost.dart';
import 'package:kievit_flutter/model/model%20dropdown%20item/model_ccname.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_ActualCost extends StatefulWidget {
  final List<ActualCostCentrePerMonthChart> dataChartActualCost;

  ChartComponent_ActualCost({
    Key? key,
    required this.dataChartActualCost,
  }) : super(key: key);

  @override
  _ChartComponent_ActualCostState createState() =>
      _ChartComponent_ActualCostState();
}

class _ChartComponent_ActualCostState extends State<ChartComponent_ActualCost> {
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
                    data!.month,
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
                      widget.dataChartActualCost[0].detail.length,
                      (i) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.dataChartActualCost[pointIndex].detail[i]
                                      .value !=
                                  0
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                  color: _colorLegend[i],
                                )
                              : Container(),
                          SizedBox(
                            width: 5,
                          ),
                          widget.dataChartActualCost[pointIndex].detail[i]
                                      .value !=
                                  0
                              ? Text(
                                  '${widget.dataChartActualCost[pointIndex].detail[i].ccname} : ',
                                  style: TextStyle(fontSize: 8))
                              : Container(),
                          widget.dataChartActualCost[pointIndex].detail[i]
                                      .value !=
                                  0
                              ? Text(
                                  widget.dataChartActualCost[pointIndex]
                                      .detail[i].value
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.w600),
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
            numberFormat: NumberFormat.simpleCurrency(),
            // interval: 15000,
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
            StackedColumnSeries<ActualCostCentrePerMonthChart, String>(
                name: widget.dataChartActualCost[0].detail[0].ccname,
                color: Color(0xFF3BA1FF),
                dataSource: widget.dataChartActualCost,
                xValueMapper: (ActualCostCentrePerMonthChart exp, _) =>
                    exp.month,
                yValueMapper: (ActualCostCentrePerMonthChart exp, _) =>
                    exp.detail[0].value,
                yAxisName: 'aum'),
            StackedColumnSeries<ActualCostCentrePerMonthChart, String>(
                name: widget.dataChartActualCost[1].detail[1].ccname,
                color: Color(0xFF8543E0),
                dataSource: widget.dataChartActualCost,
                xValueMapper: (ActualCostCentrePerMonthChart exp, _) =>
                    exp.month,
                yValueMapper: (ActualCostCentrePerMonthChart exp, _) =>
                    exp.detail[1].value,
                yAxisName: 'aum'),
            StackedColumnSeries<ActualCostCentrePerMonthChart, String>(
                name: widget.dataChartActualCost[2].detail[2].ccname,
                color: Color(0xFFEE5F77),
                dataSource: widget.dataChartActualCost,
                xValueMapper: (ActualCostCentrePerMonthChart exp, _) =>
                    exp.month,
                yValueMapper: (ActualCostCentrePerMonthChart exp, _) =>
                    exp.detail[2].value,
                yAxisName: 'aum'),
            StackedColumnSeries<ActualCostCentrePerMonthChart, String>(
                name: widget.dataChartActualCost[3].detail[3].ccname,
                color: Color(0xFFF59E0B),
                dataSource: widget.dataChartActualCost,
                xValueMapper: (ActualCostCentrePerMonthChart exp, _) =>
                    exp.month,
                yValueMapper: (ActualCostCentrePerMonthChart exp, _) =>
                    exp.detail[3].value,
                yAxisName: 'aum'),
            StackedColumnSeries<ActualCostCentrePerMonthChart, String>(
                name: widget.dataChartActualCost[4].detail[4].ccname,
                color: Color(0xFFF7CF33),
                dataSource: widget.dataChartActualCost,
                xValueMapper: (ActualCostCentrePerMonthChart exp, _) =>
                    exp.month,
                yValueMapper: (ActualCostCentrePerMonthChart exp, _) =>
                    exp.detail[4].value,
                yAxisName: 'aum'),
            StackedColumnSeries<ActualCostCentrePerMonthChart, String>(
                name: widget.dataChartActualCost[5].detail[5].ccname,
                color: Color(0xFF4AC76F),
                dataSource: widget.dataChartActualCost,
                xValueMapper: (ActualCostCentrePerMonthChart exp, _) =>
                    exp.month,
                yValueMapper: (ActualCostCentrePerMonthChart exp, _) =>
                    exp.detail[5].value,
                yAxisName: 'aum'),
            SplineSeries<ActualCostCentrePerMonthChart, String>(
                dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.top,
                    textStyle: TextStyle(
                      fontSize: 8,
                    )),
                markerSettings: MarkerSettings(
                  isVisible: true,
                ),
                name: "Total",
                color: Colors.pinkAccent,
                dataSource: widget.dataChartActualCost,
                xValueMapper: (ActualCostCentrePerMonthChart exp, _) =>
                    exp.month,
                yValueMapper: (ActualCostCentrePerMonthChart exp, _) =>
                    exp.total,
                yAxisName: 'aum'),
          ]),
    );
  }

  String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'en',
      symbol: '\$',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}
