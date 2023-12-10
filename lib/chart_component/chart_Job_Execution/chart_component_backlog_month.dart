import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kievit_flutter/model/model%20Job%20Execution/chart_model_backlog_month.dart';
import 'package:kievit_flutter/network/chart_api.dart';
import 'package:kievit_flutter/shared/color_values.dart';

class ChartComponent_BacklogMonth extends StatefulWidget {
  final BacklogMonthModel? dataChart_backlogMonthData;
  ChartComponent_BacklogMonth(
      {Key? key, required this.dataChart_backlogMonthData})
      : super(key: key);

  @override
  State<ChartComponent_BacklogMonth> createState() =>
      _ChartComponent_BacklogMonthState();
}

class _ChartComponent_BacklogMonthState
    extends State<ChartComponent_BacklogMonth> {
  DateFormat inputFormat = DateFormat('yyyy-MM-dd');
  Widget _buildTableProductRows() {
    Widget cont = Container(child: Text("No Data"));
    if (widget.dataChart_backlogMonthData!.data[0].tableBody.length > 0) {
      List<Widget> widgets = [];
      widget.dataChart_backlogMonthData!.data[0].tableBody
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
              width: MediaQuery.of(context).size.width * 0.03,
              child: Text(number.toString(),
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 9))),
          Expanded(
            child: Text(
                widget.dataChart_backlogMonthData!.data[0].tableBody[index]
                    .orderType,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 9)),
          ),
          Expanded(
              child: Text(
                  widget.dataChart_backlogMonthData!.data[0].tableBody[index]
                      .woNumber,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 9))),
          Expanded(
              flex: 3,
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Text(
                    widget.dataChart_backlogMonthData!.data[0].tableBody[index]
                        .woDesc,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 8)),
              )),
          Expanded(
              flex: 2,
              child: Text(
                  widget.dataChart_backlogMonthData!.data[0].tableBody[index]
                      .woFlocArea,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 9))),
          Expanded(
              child: Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            child: Text(
                widget
                    .dataChart_backlogMonthData!.data[0].tableBody[index].week,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 9)),
          )),
          Expanded(
              child: Text(
                  DateFormat('d-LLL-yy').format(inputFormat.parse(widget
                      .dataChart_backlogMonthData!
                      .data[0]
                      .tableBody[index]
                      .finishdate)),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 9))),
        ],
      ),
    );
  }

  Widget headerBuilder() {
    return Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(width: 2.5, color: ColorValues().primaryRed),
        )),
        padding: EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.02,
              child: Text("No",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: Text(
                  widget.dataChart_backlogMonthData!.data[0].tableHead[0],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: Text(
                  widget.dataChart_backlogMonthData!.data[0].tableHead[1],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontWeight: FontWeight.w600)),
            ),
            Expanded(
              flex: 3,
              child: Text(
                  widget.dataChart_backlogMonthData!.data[0].tableHead[2],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontWeight: FontWeight.w600)),
            ),
            Expanded(
              flex: 2,
              child: Text(
                  widget.dataChart_backlogMonthData!.data[0].tableHead[3],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: Text(
                  widget.dataChart_backlogMonthData!.data[0].tableHead[4],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: Text(
                  widget.dataChart_backlogMonthData!.data[0].tableHead[5],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          headerBuilder(),
          Container(
              height: MediaQuery.of(context).size.height * 0.43,
              child: SingleChildScrollView(
                child: _buildTableProductRows(),
              ))
        ],
      ),
    );
  }
}
