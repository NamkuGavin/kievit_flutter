import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_oee_journey.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_primary_and_breakdown_stopped.dart';
import 'package:kievit_flutter/model/model%20Loss%20Analysis/chart_model_top10_downtime_dtmonitoring.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_daily_downtime.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_supplyfailure_technicalfailurearea.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_weekly_downtime.dart';
import 'package:kievit_flutter/model/model%20Planning%20Schedule/chart_model_planning_review.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_PlanningReview extends StatefulWidget {
  List<ChartPlanningReview> dataChartPlanningReview;

  ChartComponent_PlanningReview(
      {Key? key, required this.dataChartPlanningReview})
      : super(key: key);

  @override
  _ChartComponent_PlanningReviewState createState() =>
      _ChartComponent_PlanningReviewState();
}

class _ChartComponent_PlanningReviewState
    extends State<ChartComponent_PlanningReview> {
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
                    data!.category,
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
                              widget.dataChartPlanningReview[pointIndex].color),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                            '${widget.dataChartPlanningReview[pointIndex].category} : ',
                            style: TextStyle(fontSize: 8)),
                        Text(
                          widget.dataChartPlanningReview[pointIndex].value
                              .toString(),
                          style: TextStyle(
                              fontSize: 8, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
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
            isVisible: false,
          ),
          margin: EdgeInsets.zero,
          series: <CartesianSeries>[
            BarSeries<ChartPlanningReview, String>(
                dataLabelSettings: DataLabelSettings(
                    labelAlignment: ChartDataLabelAlignment.top,
                    useSeriesColor: true,
                    showZeroValue: false,
                    isVisible: true,
                    labelPosition: ChartDataLabelPosition.inside,
                    builder: (dynamic data, dynamic point, dynamic series,
                        int pointIndex, int seriesIndex) {
                      return Container(
                          color: Colors.white.withOpacity(0.6),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: Text(
                              data!.value.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600),
                            ),
                          ));
                    }),
                pointColorMapper: (ChartPlanningReview exp, _) =>
                    HexColor("#" + exp.color),
                dataSource: widget.dataChartPlanningReview,
                xValueMapper: (ChartPlanningReview exp, _) => exp.category,
                yValueMapper: (ChartPlanningReview exp, _) => exp.value)
          ]),
    );
  }
}
