import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:kievit_flutter/model/model%20Asset%20Budgeting/chart_model_ytd.dart';
import 'package:kievit_flutter/model/model%20Planning%20Schedule/chart_model_based_on_task_time.dart';
import 'package:kievit_flutter/model/model%20Planning%20Schedule/chart_model_work_preparation.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ChartComponent_YtdRealization extends StatefulWidget {
  final List<YtdRealizationKUsdChart> chartPieYtd;
  final List<YtdRealizationKUsdChart> chartSpeedometerYtd;
  ChartComponent_YtdRealization({
    Key? key,
    required this.chartPieYtd,
    required this.chartSpeedometerYtd,
  }) : super(key: key);

  @override
  _ChartComponent_YtdRealizationState createState() =>
      _ChartComponent_YtdRealizationState();
}

class _ChartComponent_YtdRealizationState
    extends State<ChartComponent_YtdRealization> {
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
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.52,
      // padding: EdgeInsets.only(top: 5, bottom: 5),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SfCircularChart(
              palette: [Colors.blue, Colors.orange],
              annotations: <CircularChartAnnotation>[
                CircularChartAnnotation(
                    widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.chartPieYtd[1].detail!.value.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                    Text(widget.chartPieYtd[0].detail!.value.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ))
              ],
              // title: ChartTitle(
              //     text: widget.dataYtdPie.series,
              //     textStyle:
              //         TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              // tooltipBehavior: _tooltipBehavior,
              legend: Legend(isVisible: true, position: LegendPosition.bottom),
              margin: EdgeInsets.zero,
              series: <CircularSeries>[
                DoughnutSeries<YtdRealizationKUsdChart, String>(
                    explodeAll: true,
                    explodeOffset: '5%',
                    explode: true,
                    dataLabelMapper: (YtdRealizationKUsdChart data, _) =>
                        (data.detail!.percentage * 100).toInt().toString() +
                        "%",
                    dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        labelIntersectAction: LabelIntersectAction.shift,
                        labelPosition: ChartDataLabelPosition.outside,
                        connectorLineSettings:
                            ConnectorLineSettings(type: ConnectorType.curve)),
                    dataSource: widget.chartPieYtd,
                    xValueMapper: (YtdRealizationKUsdChart exp, _) =>
                        exp.legend,
                    yValueMapper: (YtdRealizationKUsdChart exp, _) =>
                        exp.detail!.percentage)
              ]),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.27,
              child: SfRadialGauge(
                enableLoadingAnimation: true,
                animationDuration: 2500,
                axes: <RadialAxis>[
                  RadialAxis(
                      ranges: <GaugeRange>[
                        GaugeRange(
                          startWidth: 25,
                          endWidth: 25,
                          startValue: -0.5,
                          endValue: 0,
                          color: Colors.green,
                        ),
                        GaugeRange(
                          startWidth: 25,
                          endWidth: 25,
                          startValue: 0,
                          endValue: 0.2,
                          color: Colors.orange,
                        ),
                        GaugeRange(
                          startWidth: 25,
                          endWidth: 25,
                          startValue: 0.2,
                          endValue: 0.5,
                          color: Colors.red,
                        ),
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            axisValue: 1,
                            positionFactor: 0.7,
                            widget: Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Text(
                                'Over\nBudget',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red),
                              ),
                            )),
                        GaugeAnnotation(
                            axisValue: -1,
                            positionFactor: 0.75,
                            widget: Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Text(
                                'Lower\nBudget',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green),
                              ),
                            )),
                        GaugeAnnotation(
                            angle: 90,
                            positionFactor: 0.25,
                            widget: Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.yellow,
                              child: Text(
                                (widget.chartSpeedometerYtd[0].budget! * 100)
                                        .toInt()
                                        .toString() +
                                    "%",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                      labelsPosition: ElementsPosition.outside,
                      startAngle: 180,
                      endAngle: 0,
                      canScaleToFit: true,
                      ticksPosition: ElementsPosition.outside,
                      radiusFactor: 1.25,
                      showTicks: true,
                      showLastLabel: true,
                      numberFormat: NumberFormat.percentPattern(),
                      maximum: 0.5,
                      minimum: -0.5,
                      maximumLabels: 10,
                      axisLabelStyle: GaugeTextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                      pointers: <GaugePointer>[
                        // NeedlePointer(
                        //   enableAnimation: true,
                        //   needleColor: Colors.orange,
                        //   gradient: const LinearGradient(colors: <Color>[
                        //     Color.fromRGBO(203, 126, 223, 0),
                        //     Color(0xFFCB7EDF)
                        //   ], stops: <double>[
                        //     0.25,
                        //     0.75
                        //   ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                        //   animationType: AnimationType.easeOutBack,
                        //   value: widget.chartSpeedometerYtd[0].budget!.toDouble(),
                        //   animationDuration: 1300,
                        //   needleStartWidth: 2,
                        //   needleEndWidth: 2,
                        //   needleLength: 0.6,
                        //   knobStyle: KnobStyle(
                        //       knobRadius: 0.05,
                        //       borderColor: Colors.b,
                        //       borderWidth: 0.07,
                        //       color: Colors.white),
                        // ),
                        NeedlePointer(
                            value: widget.chartSpeedometerYtd[0].budget!
                                .toDouble(),
                            lengthUnit: GaugeSizeUnit.factor,
                            needleLength: 0.7,
                            needleEndWidth: 5,
                            animationType: AnimationType.easeOutBack,
                            needleColor: Colors.blue.shade800,
                            knobStyle: KnobStyle(
                                knobRadius: 0.06,
                                sizeUnit: GaugeSizeUnit.factor,
                                color: Colors.black)),
                        // RangePointer(
                        //     gradient: const SweepGradient(
                        //         colors: <Color>[Colors.green, Colors.red],
                        //         stops: <double>[0.25, 0.75]
                        //     ),
                        //     value:
                        //         widget.chartSpeedometerYtd[0].budget!.toDouble(),
                        //     width: 0.1,
                        //     sizeUnit: GaugeSizeUnit.factor,
                        //     animationDuration: 1300,
                        //     animationType: AnimationType.easeOutBack,
                        //     enableAnimation: true)
                      ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
