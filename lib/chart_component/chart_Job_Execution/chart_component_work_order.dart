import 'package:flutter/material.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_oee_journey.dart';
import 'package:kievit_flutter/model/model%20Job%20Execution/chart_model_work_order.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent_WorkOrder extends StatefulWidget {
  NotificationRegistered dataChartWONotif;
  ForSafetyLegalQuality dataChartWOQuality;
  ChartComponent_WorkOrder(
      {Key? key,
      required this.dataChartWONotif,
      required this.dataChartWOQuality})
      : super(key: key);

  @override
  _ChartComponent_WorkOrderState createState() =>
      _ChartComponent_WorkOrderState();
}

class _ChartComponent_WorkOrderState extends State<ChartComponent_WorkOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5, right: 10, bottom: 5),
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
      child: Column(
        children: [
          WONotif_widget(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          WOQuality_widget(),
        ],
      ),
    );
  }

  WONotif_widget() {
    return Row(
      children: [
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      "Notification\nRegistered",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 29),
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: Text(
                              widget.dataChartWONotif.notifReg,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5), //
                              border: Border.all(
                                color: Colors.black,
                              ),
                              color: Colors.yellow)),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // radius of 10
                  color: Colors.cyan.shade100 // green as background color
                  )),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      "Gate\nKeeping",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 7),
                            child: Text(
                              "DELETED",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5), //
                              border: Border.all(
                                color: Colors.black,
                              ),
                              color: Colors.green)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: Text(
                              widget.dataChartWONotif.notifRemind.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5), //
                              border: Border.all(
                                color: Colors.black,
                              ),
                              color: Colors.green)),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // radius of 10
                  color: Colors.cyan.shade100 // green as background color
                  )),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      "Order\nDistribution",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: Text(
                              widget.dataChartWONotif.notifDelete.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5), //
                              border: Border.all(
                                color: Colors.black,
                              ),
                              color: Colors.blue)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: Text(
                              widget.dataChartWONotif.incomingOrder.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5), //
                              border: Border.all(
                                color: Colors.black,
                              ),
                              color: Colors.blue)),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // radius of 10
                  color: Colors.cyan.shade100 // green as background color
                  )),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      "Closed\nOrder",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        (widget.dataChartWONotif.percentageClose * 100)
                                .toInt()
                                .toString() +
                            "%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: Text(
                              widget.dataChartWONotif.notifClose.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5), //
                              border: Border.all(
                                color: Colors.black,
                              ),
                              color: Colors.orange)),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // radius of 10
                  color: Colors.cyan.shade100 // green as background color
                  )),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      "Open\nOrder",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        (widget.dataChartWONotif.percentageOpen * 100)
                                .toInt()
                                .toString() +
                            "%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: Text(
                              widget.dataChartWONotif.notifOpen.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5), //
                              border: Border.all(
                                color: Colors.black,
                              ),
                              color: Colors.orange)),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // radius of 10
                  color: Colors.cyan.shade100 // green as background color
                  )),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      "2WBacklog\nOrder",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        (widget.dataChartWONotif.percentageBacklog * 100)
                                .toInt()
                                .toString() +
                            "%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: Text(
                              widget.dataChartWONotif.notifBacklog.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5), //
                              border: Border.all(
                                color: Colors.black,
                              ),
                              color: Colors.orange)),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // radius of 10
                  color: Colors.cyan.shade100 // green as background color
                  )),
        ),
      ],
    );
  }

  WOQuality_widget() {
    return Row(
      children: [
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "For Safety,\nLegal, Quality",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 9),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // radius of 10
                  color: Colors.yellow // green as background color
                  )),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  widget.dataChartWOQuality.notifReg,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), // radius of 10
                  color: Colors.green // green as background color
                  )),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  widget.dataChartWOQuality.notifRemind.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), // radius of 10
                  color: Colors.blue // green as background color
                  )),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  widget.dataChartWOQuality.notifClose.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), // radius of 10
                  color: Colors.orange // green as background color
                  )),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  widget.dataChartWOQuality.notifOpen.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), // radius of 10
                  color: Colors.orange // green as background color
                  )),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  widget.dataChartWOQuality.notifBacklog.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), // radius of 10
                  color: Colors.orange // green as background color
                  )),
        ),
      ],
    );
  }
}
