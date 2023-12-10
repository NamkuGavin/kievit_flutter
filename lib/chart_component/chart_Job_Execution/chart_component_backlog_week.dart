import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_oee_journey.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_primary_and_breakdown_stopped.dart';
import 'package:kievit_flutter/model/model%20Job%20Execution/chart_model_backlog_week.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_BacklogWeek extends StatefulWidget {
  List<DetailElement> dataChartBacklogWeek;
  List<BacklogWeekData> dataBacklogWeek;
  ChartComponent_BacklogWeek(
      {Key? key,
      required this.dataChartBacklogWeek,
      required this.dataBacklogWeek})
      : super(key: key);

  @override
  _ChartComponent_BacklogWeekState createState() =>
      _ChartComponent_BacklogWeekState();
}

class _ChartComponent_BacklogWeekState
    extends State<ChartComponent_BacklogWeek> {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.dataChartBacklogWeek[pointIndex].detail!
                                      .sumclosed !=
                                  0
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                  color: _colorLegend[0],
                                )
                              : Container(),
                          SizedBox(
                            width: 5,
                          ),
                          widget.dataChartBacklogWeek[pointIndex].detail!
                                      .sumclosed !=
                                  0
                              ? Text('Sum of Status Closed : ',
                                  style: TextStyle(fontSize: 8))
                              : Container(),
                          widget.dataChartBacklogWeek[pointIndex].detail!
                                      .sumclosed !=
                                  0
                              ? Text(
                                  widget.dataChartBacklogWeek[pointIndex]
                                      .detail!.sumclosed
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
                          widget.dataChartBacklogWeek[pointIndex].detail!
                                      .sumopen !=
                                  0
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                  color: _colorLegend[1],
                                )
                              : Container(),
                          SizedBox(
                            width: 5,
                          ),
                          widget.dataChartBacklogWeek[pointIndex].detail!
                                      .sumopen !=
                                  0
                              ? Text('Sum of Status Open : ',
                                  style: TextStyle(fontSize: 8))
                              : Container(),
                          widget.dataChartBacklogWeek[pointIndex].detail!
                                      .sumopen !=
                                  0
                              ? Text(
                                  widget.dataChartBacklogWeek[pointIndex]
                                      .detail!.sumopen
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
                          widget.dataChartBacklogWeek[pointIndex].detail!
                                      .sumbacklog !=
                                  0
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                  color: _colorLegend[2],
                                )
                              : Container(),
                          SizedBox(
                            width: 5,
                          ),
                          widget.dataChartBacklogWeek[pointIndex].detail!
                                      .sumbacklog !=
                                  0
                              ? Text('Sum of Status Backlog2W : ',
                                  style: TextStyle(fontSize: 8))
                              : Container(),
                          widget.dataChartBacklogWeek[pointIndex].detail!
                                      .sumbacklog !=
                                  0
                              ? Text(
                                  widget.dataChartBacklogWeek[pointIndex]
                                      .detail!.sumbacklog
                                      .toString(),
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

  DateFormat inputFormat = DateFormat('yyyy-MM-dd');
  Widget _buildTableProductRows() {
    Widget cont = Container(child: Text("No Data"));
    if (widget.dataBacklogWeek[1].detail[0].tableBody!.length > 0) {
      List<Widget> widgets = [];
      widget.dataBacklogWeek[1].detail[0].tableBody!
          .asMap()
          .forEach((index, _) {
        widgets.add(tableBody(index));
      });
      cont = Column(
        children: widgets,
      );
    }
    return Container(child: cont);
  }

  Widget tableBody(int index) {
    int number = index + 1;
    return Container(
      child: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.04,
              child: Text(number.toString(),
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 9))),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: Text(
                  widget.dataBacklogWeek[1].detail[0].tableBody![index].mtcType,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 9)),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Text(
                    widget.dataBacklogWeek[1].detail[0].tableBody![index]
                        .backlogDesc,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 9)),
              )),
          Expanded(
              child: Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            child: Text(
                DateFormat('d-LLL-yy').format(inputFormat.parse(widget
                    .dataBacklogWeek[1]
                    .detail[0]
                    .tableBody![index]
                    .finishdate)),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 8)),
          )),
        ],
      ),
    );
  }

  Widget headerBuilder() {
    return Container(
        padding: EdgeInsets.all(5),
        color: ColorValues().primaryRed,
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.035,
              child: Text("No",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: Text(widget.dataBacklogWeek[1].detail[0].tableHead![0],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w600)),
            ),
            Expanded(
              flex: 3,
              child: Text(widget.dataBacklogWeek[1].detail[0].tableHead![1],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: Text(widget.dataBacklogWeek[1].detail[0].tableHead![2],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      child: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
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
                    title: ChartTitle(
                        text: widget.dataBacklogWeek[0].series,
                        textStyle:
                            TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                    primaryYAxis: NumericAxis(
                      interval: 10,
                      labelStyle: TextStyle(color: Colors.black),
                      axisLine: AxisLine(width: 0),
                      majorGridLines: MajorGridLines(
                          width: 1,
                          color: Colors.black.withOpacity(0.2),
                          dashArray: <double>[5, 2]),
                      majorTickLines: MajorTickLines(width: 0),
                    ),
                    primaryXAxis: CategoryAxis(
                      labelRotation: -45,
                      labelStyle: TextStyle(color: Colors.black, fontSize: 9),
                      interval: 2,
                      majorGridLines: MajorGridLines(width: 0),
                    ),
                    tooltipBehavior: _tooltipBehavior,
                    legend: Legend(
                      width: '150%',
                      textStyle: TextStyle(fontSize: 12),
                      isVisible: true,
                      position: LegendPosition.bottom,
                      orientation: LegendItemOrientation.horizontal,
                    ),
                    margin: EdgeInsets.zero,
                    series: <CartesianSeries>[
                      StackedColumnSeries<DetailElement, String>(
                          name: "Sum of Status Closed",
                          color: _colorLegend[0],
                          dataSource: widget.dataChartBacklogWeek,
                          xValueMapper: (DetailElement exp, _) => exp.week,
                          yValueMapper: (DetailElement exp, _) =>
                              exp.detail!.sumclosed),
                      StackedColumnSeries<DetailElement, String>(
                          name: "Sum of Status Open",
                          color: _colorLegend[1],
                          dataSource: widget.dataChartBacklogWeek,
                          xValueMapper: (DetailElement exp, _) => exp.week,
                          yValueMapper: (DetailElement exp, _) =>
                              exp.detail!.sumopen),
                      StackedColumnSeries<DetailElement, String>(
                          name: "Sum of Status Backlog2W",
                          color: _colorLegend[2],
                          dataSource: widget.dataChartBacklogWeek,
                          xValueMapper: (DetailElement exp, _) => exp.week,
                          yValueMapper: (DetailElement exp, _) =>
                              exp.detail!.sumbacklog),
                    ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Column(
                  children: [
                    headerBuilder(),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.42,
                        child: SingleChildScrollView(
                          child: _buildTableProductRows(),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
