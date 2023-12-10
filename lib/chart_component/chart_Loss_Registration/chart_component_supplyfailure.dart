import 'package:flutter/material.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_oee_journey.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_primary_and_breakdown_stopped.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_supplyfailure_technicalfailurearea.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_SupplyFailure extends StatefulWidget {
  List<Chart_model_SupplyFailureTechnicalFailureArea>
      dataChartSupplyFailureTechnicalFailureArea;

  ChartComponent_SupplyFailure(
      {Key? key, required this.dataChartSupplyFailureTechnicalFailureArea})
      : super(key: key);

  @override
  _ChartComponent_SupplyFailureState createState() =>
      _ChartComponent_SupplyFailureState();
}

class _ChartComponent_SupplyFailureState
    extends State<ChartComponent_SupplyFailure> {
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
                    data!.years,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 10),
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
                    children: List.generate(
                      widget.dataChartSupplyFailureTechnicalFailureArea[0]
                          .detail.length,
                      (i) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget
                                      .dataChartSupplyFailureTechnicalFailureArea[
                                          pointIndex]
                                      .detail[i]['value']
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
                            width: 5,
                          ),
                          widget
                                      .dataChartSupplyFailureTechnicalFailureArea[
                                          pointIndex]
                                      .detail[i]['value']
                                      .toString() !=
                                  "0"
                              ? Text(
                                  '${widget.dataChartSupplyFailureTechnicalFailureArea[pointIndex].detail[i]['category']} : ',
                                  style: TextStyle(fontSize: 10))
                              : Container(),
                          widget
                                      .dataChartSupplyFailureTechnicalFailureArea[
                                          pointIndex]
                                      .detail[i]['value']
                                      .toString() !=
                                  "0"
                              ? Text(
                                  widget
                                      .dataChartSupplyFailureTechnicalFailureArea[
                                          pointIndex]
                                      .detail[i]['value']
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
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
                        fontSize: 10),
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
          ),
          axes: <ChartAxis>[
            NumericAxis(
                title: AxisTitle(text: 'All Total Stop'),
                labelStyle: TextStyle(color: Colors.black),
                axisLine: AxisLine(width: 0),
                majorGridLines: MajorGridLines(
                    width: 1,
                    color: Colors.black.withOpacity(0.2),
                    dashArray: <double>[5, 2]),
                majorTickLines: MajorTickLines(width: 0),
                name: 'units',
                opposedPosition: true),
          ],
          tooltipBehavior: _tooltipBehavior,
          legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            orientation: LegendItemOrientation.horizontal,
          ),
          margin: EdgeInsets.zero,
          series: <CartesianSeries>[
            StackedColumnSeries<Chart_model_SupplyFailureTechnicalFailureArea,
                    String>(
                name: widget.dataChartSupplyFailureTechnicalFailureArea[0]
                    .detail[0]['category'],
                color: _colorLegend[0],
                dataSource: widget.dataChartSupplyFailureTechnicalFailureArea,
                xValueMapper:
                    (Chart_model_SupplyFailureTechnicalFailureArea exp, _) =>
                        exp.years,
                yValueMapper:
                    (Chart_model_SupplyFailureTechnicalFailureArea exp, _) =>
                        exp.detail[0]['value'],
                yAxisName: 'aum'),
            StackedColumnSeries<Chart_model_SupplyFailureTechnicalFailureArea,
                    String>(
                name: widget.dataChartSupplyFailureTechnicalFailureArea[0]
                    .detail[1]['category'],
                color: _colorLegend[1],
                dataSource: widget.dataChartSupplyFailureTechnicalFailureArea,
                xValueMapper:
                    (Chart_model_SupplyFailureTechnicalFailureArea exp, _) =>
                        exp.years,
                yValueMapper:
                    (Chart_model_SupplyFailureTechnicalFailureArea exp, _) =>
                        exp.detail[1]['value'],
                yAxisName: 'aum'),
            SplineSeries<Chart_model_SupplyFailureTechnicalFailureArea, String>(
                dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.top,
                    textStyle: TextStyle(
                      fontSize: 9,
                    )),
                name: "Total",
                color: Colors.blue,
                markerSettings: MarkerSettings(
                  isVisible: true,
                ),
                dataSource: widget.dataChartSupplyFailureTechnicalFailureArea,
                xValueMapper:
                    (Chart_model_SupplyFailureTechnicalFailureArea exp, _) =>
                        exp.years,
                yValueMapper:
                    (Chart_model_SupplyFailureTechnicalFailureArea exp, _) =>
                        exp.totals,
                yAxisName: 'aum',
                enableTooltip: false),
          ]),
    );
  }
}
