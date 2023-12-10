import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kievit_flutter/model/model%20Asset%20Budgeting/chart_model_ytd.dart';
import 'package:kievit_flutter/model/model%20Cost%20Analysis/chart_model_order_ratio.dart';
import 'package:kievit_flutter/model/model%20Planning%20Schedule/chart_model_based_on_task_time.dart';
import 'package:kievit_flutter/model/model%20Planning%20Schedule/chart_model_work_preparation.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_PMOrderRatio extends StatefulWidget {
  final List<PmOrderRatioData> chartRatio;
  ChartComponent_PMOrderRatio({
    Key? key,
    required this.chartRatio,
  }) : super(key: key);

  @override
  _ChartComponent_PMOrderRatioState createState() =>
      _ChartComponent_PMOrderRatioState();
}

class _ChartComponent_PMOrderRatioState
    extends State<ChartComponent_PMOrderRatio> {
  // late TooltipBehavior _tooltipBehavior;

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

  // @override
  // void initState() {
  //   // TODO: implement initState
  //
  //   _tooltipBehavior = TooltipBehavior(enable: false);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.52,
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
          palette: [
            Color(0xFF1890FF),
            Color(0xFF8543E0),
            Color(0xFF4AC76F),
            Color(0xFFF7CF33),
            Color(0xFFEE5F77)
          ],
          annotations: <CircularChartAnnotation>[
            CircularChartAnnotation(
                widget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Total",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                Text(widget.chartRatio[4].value.ceil().toInt().toString() + "%",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
              ],
            ))
          ],
          title: ChartTitle(
              text: "PM Order Ratio" + "\n",
              textStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
          // tooltipBehavior: _tooltipBehavior,
          legend: Legend(
              isVisible: true,
              height: "200%",
              textStyle: TextStyle(fontSize: 12),
              isResponsive: true),
          margin: EdgeInsets.zero,
          series: <CircularSeries>[
            DoughnutSeries<PmOrderRatioData, String>(
                explodeAll: true,
                explodeOffset: '5%',
                explode: true,
                dataLabelMapper: (PmOrderRatioData data, _) =>
                    data.value.ceil().toInt().toString() + "%",
                dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelIntersectAction: LabelIntersectAction.shift,
                    labelPosition: ChartDataLabelPosition.outside,
                    connectorLineSettings:
                        ConnectorLineSettings(type: ConnectorType.curve)),
                dataSource: widget.chartRatio,
                xValueMapper: (PmOrderRatioData exp, _) => exp.name,
                yValueMapper: (PmOrderRatioData exp, _) => exp.value)
          ]),
    );
  }
}
