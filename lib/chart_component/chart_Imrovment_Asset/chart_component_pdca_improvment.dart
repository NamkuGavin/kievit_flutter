import 'package:flutter/material.dart';
import 'package:kievit_flutter/model/model%20Improvment%20Asset/chart_model_pdca_improvment.dart';
import 'package:kievit_flutter/model/model%20Loss%20Analysis/chart_model_top10_downtime_dtmonitoring.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:kievit_flutter/shared/custom_dialog.dart';
import 'package:kievit_flutter/shared/shared_code.dart';

class ChartComponent_PDCAImprovment extends StatefulWidget {
  final Chart_model_PDCA_Improvment? dataChartPDCA_Improvment;
  ChartComponent_PDCAImprovment(
      {Key? key, required this.dataChartPDCA_Improvment})
      : super(key: key);

  @override
  _ChartComponent_PDCAImprovmentState createState() =>
      _ChartComponent_PDCAImprovmentState();
}

class _ChartComponent_PDCAImprovmentState
    extends State<ChartComponent_PDCAImprovment> {
  Widget _buildTableDataDo() {
    Widget cont = Container(child: Text("No Data"));
    if (widget.dataChartPDCA_Improvment!.data.dataDo.length > 0) {
      List<Widget> widgets = [];
      widget.dataChartPDCA_Improvment!.data.dataDo.asMap().forEach((index, _) {
        widgets.add(tableBodyDataDo(index));
      });
      cont = SingleChildScrollView(
        child: Column(
          children: widgets,
        ),
      );
    }
    return Container(child: cont);
  }

  Widget _buildTableAction() {
    Widget cont = Container(child: Text("No Data"));
    if (widget.dataChartPDCA_Improvment!.data.action.length > 0) {
      List<Widget> widgets = [];
      widget.dataChartPDCA_Improvment!.data.action.asMap().forEach((index, _) {
        widgets.add(tableBodyAction(index));
      });
      cont = SingleChildScrollView(
        child: Column(
          children: widgets,
        ),
      );
    }
    return Container(child: cont);
  }

  Widget tableBodyDataDo(int index) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Text(
                  "     .  " +
                      widget.dataChartPDCA_Improvment!.data.dataDo[index].value,
                  style: TextStyle(fontSize: 9)),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.13,
              child: Text(
                  widget.dataChartPDCA_Improvment!.data.dataDo[index].pic,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 9))),
          Container(
              width: MediaQuery.of(context).size.width * 0.15,
              child: Text(
                  widget.dataChartPDCA_Improvment!.data.dataDo[index].dueDate,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 9))),
          Container(
              width: MediaQuery.of(context).size.width * 0.11,
              child: Text(
                  widget.dataChartPDCA_Improvment!.data.dataDo[index].status,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 9))),
        ],
      ),
    );
  }

  Widget tableBodyAction(int index) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Text(
                  "     .  " +
                      widget.dataChartPDCA_Improvment!.data.action[index].value,
                  style: TextStyle(fontSize: 9)),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.13,
              child: Text(
                  widget.dataChartPDCA_Improvment!.data.action[index].pic,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 9))),
          Container(
              width: MediaQuery.of(context).size.width * 0.15,
              child: Text(
                  widget.dataChartPDCA_Improvment!.data.action[index].dueDate,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 9))),
          Container(
              width: MediaQuery.of(context).size.width * 0.11,
              child: Text(
                  widget.dataChartPDCA_Improvment!.data.action[index].status,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 9))),
        ],
      ),
    );
  }

  // Widget headerBuilder1() {
  //   return Container(
  //       padding: EdgeInsets.all(5),
  //       color: ColorValues().primaryRed,
  //       child: Center(
  //         child: Container(
  //           child: Text("Issue & RCA",
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 9,
  //                   fontWeight: FontWeight.w600)),
  //         ),
  //       ));
  // }
  //
  // Widget headerBuilder2() {
  //   return Container(
  //       padding: EdgeInsets.all(5),
  //       color: ColorValues().primaryRed,
  //       child: Center(
  //         child: Container(
  //           child: Text("Possible caused",
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 9,
  //                   fontWeight: FontWeight.w600)),
  //         ),
  //       ));
  // }
  //
  // Widget headerBuilder3() {
  //   return Container(
  //       padding: EdgeInsets.all(5),
  //       color: ColorValues().primaryRed,
  //       child: Center(
  //         child: Container(
  //           child: Text("Plan",
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 9,
  //                   fontWeight: FontWeight.w600)),
  //         ),
  //       ));
  // }
  //
  // Widget headerBuilder4() {
  //   return Container(
  //       padding: EdgeInsets.all(5),
  //       color: ColorValues().primaryRed,
  //       child: Row(
  //         children: <Widget>[
  //           Expanded(
  //             child: Text("Do",
  //                 textAlign: TextAlign.start,
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 8,
  //                     fontWeight: FontWeight.w600)),
  //           ),
  //           Container(
  //             width: MediaQuery.of(context).size.width * 0.13,
  //             child: Text("PIC",
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 8,
  //                     fontWeight: FontWeight.w600)),
  //           ),
  //           Container(
  //             width: MediaQuery.of(context).size.width * 0.15,
  //             child: Text("Due date",
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 8,
  //                     fontWeight: FontWeight.w600)),
  //           ),
  //           Container(
  //               width: MediaQuery.of(context).size.width * 0.1,
  //               child: Column(
  //                 children: [
  //                   Text("Status",
  //                       textAlign: TextAlign.center,
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 8,
  //                           fontWeight: FontWeight.w600)),
  //                 ],
  //               )),
  //         ],
  //       ));
  // }
  //
  // Widget headerBuilder5() {
  //   return Container(
  //       padding: EdgeInsets.all(5),
  //       color: ColorValues().primaryRed,
  //       child: Center(
  //         child: Container(
  //           child: Text("Check",
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 9,
  //                   fontWeight: FontWeight.w600)),
  //         ),
  //       ));
  // }
  //
  // Widget headerBuilder6() {
  //   return Container(
  //       padding: EdgeInsets.all(5),
  //       color: ColorValues().primaryRed,
  //       child: Row(
  //         children: <Widget>[
  //           Expanded(
  //             child: Text("Action (prevention)",
  //                 textAlign: TextAlign.start,
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 8,
  //                     fontWeight: FontWeight.w600)),
  //           ),
  //           Container(
  //             width: MediaQuery.of(context).size.width * 0.13,
  //             child: Text("PIC",
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 8,
  //                     fontWeight: FontWeight.w600)),
  //           ),
  //           Container(
  //             width: MediaQuery.of(context).size.width * 0.15,
  //             child: Text("Due date",
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 8,
  //                     fontWeight: FontWeight.w600)),
  //           ),
  //           Container(
  //               width: MediaQuery.of(context).size.width * 0.1,
  //               child: Column(
  //                 children: [
  //                   Text("Status",
  //                       textAlign: TextAlign.center,
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 8,
  //                           fontWeight: FontWeight.w600)),
  //                 ],
  //               )),
  //         ],
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.53,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("1. a. Issue & RCA",
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                Text(
                  "        " + widget.dataChartPDCA_Improvment!.data.issueRca,
                  style: TextStyle(fontSize: 9),
                ),
                Text("   b. Possible caused",
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                Text(
                  "        " +
                      widget.dataChartPDCA_Improvment!.data.possibleCause,
                  style: TextStyle(fontSize: 9),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("2. Plan",
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                Text(
                  "        " + widget.dataChartPDCA_Improvment!.data.plan,
                  style: TextStyle(fontSize: 9),
                ),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("3. Do",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Text("PIC",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.13,
                        child: Text("Due date",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        child: Text("Status",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  _buildTableDataDo(),
                ],
              )),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("4. Check",
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                Text(
                  "        " + widget.dataChartPDCA_Improvment!.data.check,
                  style: TextStyle(fontSize: 9),
                ),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("5. Action (prevention)",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Text("PIC",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.13,
                        child: Text("Due date",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        child: Text("Status",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  _buildTableAction(),
                ],
              )),
        ],
      ),
    );
  }
}
