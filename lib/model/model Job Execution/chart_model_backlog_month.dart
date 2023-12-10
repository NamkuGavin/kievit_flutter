// To parse this JSON data, do
//
//     final backlogMonthModel = backlogMonthModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BacklogMonthModel backlogMonthModelFromJson(String str) =>
    BacklogMonthModel.fromJson(json.decode(str));

String backlogMonthModelToJson(BacklogMonthModel data) =>
    json.encode(data.toJson());

class BacklogMonthModel {
  BacklogMonthModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  List<BacklogMonthData> data;

  factory BacklogMonthModel.fromJson(Map<String, dynamic> json) =>
      BacklogMonthModel(
        message: json["message"],
        status: json["status"],
        data: List<BacklogMonthData>.from(
            json["data"].map((x) => BacklogMonthData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BacklogMonthData {
  BacklogMonthData({
    required this.tableHead,
    required this.tableBody,
  });

  List<String> tableHead;
  List<TableBody> tableBody;

  factory BacklogMonthData.fromJson(Map<String, dynamic> json) =>
      BacklogMonthData(
        tableHead: List<String>.from(json["table_head"].map((x) => x)),
        tableBody: List<TableBody>.from(
            json["table_body"].map((x) => TableBody.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "table_head": List<dynamic>.from(tableHead.map((x) => x)),
        "table_body": List<dynamic>.from(tableBody.map((x) => x.toJson())),
      };
}

class TableBody {
  TableBody({
    required this.orderType,
    required this.woNumber,
    required this.woDesc,
    required this.woFlocArea,
    required this.week,
    required this.finishdate,
  });

  String orderType;
  String woNumber;
  String woDesc;
  String woFlocArea;
  String week;
  String finishdate;

  factory TableBody.fromJson(Map<String, dynamic> json) => TableBody(
        orderType: json["order_type"],
        woNumber: json["wo_number"],
        woDesc: json["wo_desc"],
        woFlocArea: json["wo_floc_area"],
        week: json["week"],
        finishdate: json["finishdate"],
      );

  Map<String, dynamic> toJson() => {
        "order_type": orderType,
        "wo_number": woNumber,
        "wo_desc": woDesc,
        "wo_floc_area": woFlocArea,
        "week": week,
        "finishdate": finishdate,
      };
}
