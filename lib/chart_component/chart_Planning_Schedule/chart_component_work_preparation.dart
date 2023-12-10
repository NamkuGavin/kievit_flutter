import 'package:flutter/material.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_oee_journey.dart';
import 'package:kievit_flutter/model/model%20Planning%20Schedule/chart_model_work_preparation.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_WorkPreparation extends StatefulWidget {
  List<Chart> dataChartWorkPreparation;
  List<Chart> dataChartPMOrder;
  List<WorkPreparationData> dataChartTitle;

  ChartComponent_WorkPreparation(
      {Key? key,
      required this.dataChartWorkPreparation,
      required this.dataChartTitle,
      required this.dataChartPMOrder})
      : super(key: key);

  @override
  _ChartComponent_WorkPreparationState createState() =>
      _ChartComponent_WorkPreparationState();
}

class _ChartComponent_WorkPreparationState
    extends State<ChartComponent_WorkPreparation> {
  late TooltipBehavior _tooltipBehavior;

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
            width: MediaQuery.of(context).size.width * 0.33,
            height: MediaQuery.of(context).size.height * 0.55,
            padding: EdgeInsets.only(top: 10, left: 5, right: 10),
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
                  Colors.blue,
                  Colors.orange,
                ],
                title: ChartTitle(
                    text: widget.dataChartTitle[0].series + "\n",
                    textStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                tooltipBehavior: _tooltipBehavior,
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                  orientation: LegendItemOrientation.horizontal,
                ),
                margin: EdgeInsets.zero,
                series: <CircularSeries>[
                  PieSeries<Chart, String>(
                    dataLabelSettings: DataLabelSettings(
                        useSeriesColor: true,
                        isVisible: true,
                        labelIntersectAction: LabelIntersectAction.shift,
                        labelPosition: ChartDataLabelPosition.outside,
                        connectorLineSettings:
                            ConnectorLineSettings(type: ConnectorType.curve)),
                    dataLabelMapper: (Chart data, _) =>
                        (data.detail.percentage * 100).toInt().toString() +
                        "%" +
                        ", " +
                        data.detail.value.toString(),
                    dataSource: widget.dataChartWorkPreparation,
                    xValueMapper: (Chart data, _) => data.point,
                    yValueMapper: (Chart data, _) => data.detail.percentage,
                  )
                ]),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Container(
            width: MediaQuery.of(context).size.width * 0.33,
            height: MediaQuery.of(context).size.height * 0.55,
            padding: EdgeInsets.only(top: 10, left: 5, right: 10),
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
                palette: [Colors.green, Colors.blue, Colors.orange],
                title: ChartTitle(
                    text: widget.dataChartTitle[1].series + "\n",
                    textStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                tooltipBehavior: _tooltipBehavior,
                legend: Legend(
                  textStyle: TextStyle(fontSize: 8),
                  isVisible: true,
                  position: LegendPosition.bottom,
                  orientation: LegendItemOrientation.horizontal,
                ),
                margin: EdgeInsets.zero,
                series: <CircularSeries>[
                  PieSeries<Chart, String>(
                    dataLabelSettings: DataLabelSettings(
                        useSeriesColor: true,
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.outside,
                        labelIntersectAction: LabelIntersectAction.shift,
                        connectorLineSettings:
                            ConnectorLineSettings(type: ConnectorType.curve)),
                    dataSource: widget.dataChartPMOrder,
                    dataLabelMapper: (Chart data, _) =>
                        (data.detail.percentage * 100).toInt().toString() +
                        "%" +
                        ", " +
                        data.detail.value.toString(),
                    xValueMapper: (Chart data, _) => data.point,
                    yValueMapper: (Chart data, _) => data.detail.percentage,
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
