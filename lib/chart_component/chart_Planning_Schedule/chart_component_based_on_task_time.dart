import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kievit_flutter/model/model%20Planning%20Schedule/chart_model_based_on_task_time.dart';
import 'package:kievit_flutter/model/model%20Planning%20Schedule/chart_model_work_preparation.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_BasedTaskTime extends StatefulWidget {
  List<DetailBasedTaskTime> dataChartBasedTask;
  List<DetailBasedTaskTime> dataChartBasedTime;
  List<BasedTaskTimeData> dataChartBased;
  ChartComponent_BasedTaskTime(
      {Key? key,
      required this.dataChartBasedTask,
      required this.dataChartBasedTime,
      required this.dataChartBased})
      : super(key: key);

  @override
  _ChartComponent_BasedTaskTimeState createState() =>
      _ChartComponent_BasedTaskTimeState();
}

class _ChartComponent_BasedTaskTimeState
    extends State<ChartComponent_BasedTaskTime> {
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

    _tooltipBehavior = TooltipBehavior(enable: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.5,
            padding: EdgeInsets.only(top: 5, left: 5, right: 10),
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
            child: SfCircularChart(
                annotations: <CircularChartAnnotation>[
                  CircularChartAnnotation(
                      widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.dataChartBased[0].chart.unit.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10)),
                      Text(widget.dataChartBased[0].chart.unit.value.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10)),
                    ],
                  ))
                ],
                title: ChartTitle(
                    text: widget.dataChartBased[0].series + "\n",
                    textStyle:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                tooltipBehavior: _tooltipBehavior,
                legend: Legend(isVisible: false),
                margin: EdgeInsets.zero,
                series: <CircularSeries>[
                  DoughnutSeries<DetailBasedTaskTime, String>(
                      explodeAll: true,
                      explodeOffset: '5%',
                      explode: true,
                      dataLabelMapper: (DetailBasedTaskTime data, _) =>
                          (data.value * 100).toInt().toString() + "%",
                      dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelIntersectAction: LabelIntersectAction.shift,
                          labelPosition: ChartDataLabelPosition.outside,
                          connectorLineSettings:
                              ConnectorLineSettings(type: ConnectorType.curve)),
                      dataSource: widget.dataChartBasedTask,
                      pointColorMapper: (DetailBasedTaskTime exp, _) =>
                          HexColor("#" + exp.color),
                      xValueMapper: (DetailBasedTaskTime exp, _) =>
                          exp.category,
                      yValueMapper: (DetailBasedTaskTime exp, _) => exp.value)
                ]),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.5,
            padding: EdgeInsets.only(top: 5, left: 5, right: 10),
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
            child: SfCircularChart(
                annotations: <CircularChartAnnotation>[
                  CircularChartAnnotation(
                      widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.dataChartBased[1].chart.unit.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10)),
                      Text(widget.dataChartBased[1].chart.unit.value.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10)),
                    ],
                  ))
                ],
                title: ChartTitle(
                    text: widget.dataChartBased[1].series + "\n",
                    textStyle:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                tooltipBehavior: _tooltipBehavior,
                legend: Legend(isVisible: false),
                margin: EdgeInsets.zero,
                series: <CircularSeries>[
                  DoughnutSeries<DetailBasedTaskTime, String>(
                      explodeAll: true,
                      explodeOffset: '5%',
                      explode: true,
                      dataLabelMapper: (DetailBasedTaskTime data, _) =>
                          (data.value * 100).toInt().toString() + "%",
                      dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelIntersectAction: LabelIntersectAction.shift,
                          labelPosition: ChartDataLabelPosition.outside,
                          connectorLineSettings:
                              ConnectorLineSettings(type: ConnectorType.curve)),
                      dataSource: widget.dataChartBasedTime,
                      pointColorMapper: (DetailBasedTaskTime exp, _) =>
                          HexColor("#" + exp.color),
                      xValueMapper: (DetailBasedTaskTime exp, _) =>
                          exp.category,
                      yValueMapper: (DetailBasedTaskTime exp, _) => exp.value)
                ]),
          ),
        ],
      ),
    );
  }
}
