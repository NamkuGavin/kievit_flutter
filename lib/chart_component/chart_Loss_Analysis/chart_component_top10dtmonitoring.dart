import 'package:flutter/material.dart';
import 'package:kievit_flutter/model/model%20Loss%20Analysis/chart_model_top10_downtime_dtmonitoring.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:kievit_flutter/shared/custom_dialog.dart';
import 'package:kievit_flutter/shared/shared_code.dart';

class ChartComponent_Top10DTMonitoring extends StatefulWidget {
  final List<Chart_model_Top10Downtime_DTMonitoring>
      dataChartTop10Downtime_DTMonitoring;
  ChartComponent_Top10DTMonitoring(
      {Key? key, required this.dataChartTop10Downtime_DTMonitoring})
      : super(key: key);

  @override
  _ChartComponent_Top10DTMonitoringState createState() =>
      _ChartComponent_Top10DTMonitoringState();
}

class _ChartComponent_Top10DTMonitoringState
    extends State<ChartComponent_Top10DTMonitoring> {
  Widget _buildTableProductRows() {
    Widget cont = Container(child: Text("No Data"));
    if (widget.dataChartTop10Downtime_DTMonitoring.length > 0) {
      List<Widget> widgets = [];
      widget.dataChartTop10Downtime_DTMonitoring.asMap().forEach((index, _) {
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
              width: MediaQuery.of(context).size.width * 0.05,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Text(number.toString(),
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 9)),
              )),
          Expanded(
            child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Container(
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                  child: Text(
                      widget.dataChartTop10Downtime_DTMonitoring[index].names,
                      style: TextStyle(fontSize: 9)),
                )),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.11,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Text(
                    widget.dataChartTop10Downtime_DTMonitoring[index].detail[0]
                        ['value'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 9)),
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.085,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Text(
                    widget.dataChartTop10Downtime_DTMonitoring[index]
                        .detail[1]['value']
                        .toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 9)),
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.07,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: widget.dataChartTop10Downtime_DTMonitoring[index]
                            .detail[2]['value'] ==
                        'Controlable'
                    ? Image.asset('assets/icons/controlable_icon.png',
                        width: 15, height: 15)
                    : Image.asset('assets/icons/monitoring_icon.png',
                        width: 15, height: 15),
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
              child: Text("Name/Unplanned DT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w600)),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text("last DT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w600)),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text("Days noDT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w600)),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.06,
                child: Column(
                  children: [
                    Text("status DT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w600)),
                  ],
                )),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Column(
        children: [
          headerBuilder(),
          Container(
              height: MediaQuery.of(context).size.height * 0.41,
              child: SingleChildScrollView(
                child: _buildTableProductRows(),
              ))
        ],
      ),
    );
  }
}
