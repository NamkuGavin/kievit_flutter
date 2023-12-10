import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_oee_journey.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_primary_and_breakdown_stopped.dart';
import 'package:kievit_flutter/model/model%20Loss%20Analysis/chart_model_comperative_downtime.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_ComperativeDowntime extends StatefulWidget {
  List<Chart_model_Comperative_Downtime> dataChartComperativeDowntime;

  ChartComponent_ComperativeDowntime(
      {Key? key, required this.dataChartComperativeDowntime})
      : super(key: key);

  @override
  _ChartComponent_ComperativeDowntimeState createState() =>
      _ChartComponent_ComperativeDowntimeState();
}

class _ChartComponent_ComperativeDowntimeState
    extends State<ChartComponent_ComperativeDowntime> {
  late TooltipBehavior _tooltipBehavior;

  final List<Color> _colorLegend = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.brown,
    Colors.grey,
    Colors.transparent
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
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width * 0.15,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
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
                  widget.dataChartComperativeDowntime[pointIndex].index,
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
                Column(children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.02,
                        width: MediaQuery.of(context).size.width * 0.01,
                        color: HexColor("#" +
                            widget.dataChartComperativeDowntime[pointIndex]
                                .detail.color),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                          '${widget.dataChartComperativeDowntime[pointIndex].detail.status} : ',
                          style: TextStyle(fontSize: 7)),
                      Text(
                        widget.dataChartComperativeDowntime[pointIndex].detail
                            .high
                            .toString(),
                        style:
                            TextStyle(fontSize: 7, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ]),
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
            labelStyle: TextStyle(color: Colors.black, fontSize: 6),
            interval: 1,
            majorGridLines: MajorGridLines(width: 0),
          ),
          axes: <ChartAxis>[
            NumericAxis(
                title: AxisTitle(text: 'All Total Stop'),
                labelStyle: TextStyle(color: Colors.black),
                axisLine: AxisLine(width: 0),
                majorGridLines: MajorGridLines(
                    width: 0,
                    color: Colors.black.withOpacity(0.2),
                    dashArray: <double>[5, 2]),
                majorTickLines: MajorTickLines(width: 0),
                name: 'units',
                opposedPosition: true),
          ],
          tooltipBehavior: _tooltipBehavior,
          legend: Legend(
            isVisible: true,
            orientation: LegendItemOrientation.horizontal,
            legendItemBuilder:
                (String name, dynamic series, dynamic point, int index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.01,
                      height: MediaQuery.of(context).size.height * 0.02,
                      color: HexColor("#" +
                          widget.dataChartComperativeDowntime[index].detail
                              .color),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Text(
                      widget.dataChartComperativeDowntime[index].detail.status,
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              );
            },
            position: LegendPosition.bottom,
          ),
          margin: EdgeInsets.zero,
          series: <CartesianSeries>[
            StackedColumnSeries<Chart_model_Comperative_Downtime, String>(
                enableTooltip: false,
                color: _colorLegend[8],
                dataSource: widget.dataChartComperativeDowntime,
                xValueMapper: (Chart_model_Comperative_Downtime exp, _) =>
                    exp.index,
                yValueMapper: (Chart_model_Comperative_Downtime exp, _) =>
                    exp.detail.low,
                yAxisName: 'aum'),
            StackedColumnSeries<Chart_model_Comperative_Downtime, String>(
                enableTooltip: false,
                dataLabelSettings: DataLabelSettings(
                  showZeroValue: false,
                  offset: Offset(0, 30),
                  labelAlignment: ChartDataLabelAlignment.outer,
                  isVisible: true,
                ),
                dataSource: widget.dataChartComperativeDowntime,
                pointColorMapper: (Chart_model_Comperative_Downtime exp, _) =>
                    HexColor("#" + exp.detail.color),
                xValueMapper: (Chart_model_Comperative_Downtime exp, _) =>
                    exp.index,
                yValueMapper: (Chart_model_Comperative_Downtime exp, _) =>
                    exp.detail.high,
                yAxisName: 'aum'),
          ]),
    );
  }
}
