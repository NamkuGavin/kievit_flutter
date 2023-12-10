// To parse this JSON data, do
//
//     final backlogWeekModel = backlogWeekModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BacklogWeekModel backlogWeekModelFromJson(String str) =>
    BacklogWeekModel.fromJson(json.decode(str));

String backlogWeekModelToJson(BacklogWeekModel data) =>
    json.encode(data.toJson());

class BacklogWeekModel {
  BacklogWeekModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  List<BacklogWeekData> data;

  factory BacklogWeekModel.fromJson(Map<String, dynamic> json) =>
      BacklogWeekModel(
        message: json["message"],
        status: json["status"],
        data: List<BacklogWeekData>.from(
            json["data"].map((x) => BacklogWeekData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BacklogWeekData {
  BacklogWeekData({
    required this.series,
    required this.type,
    required this.detail,
  });

  String series;
  String type;
  List<DetailElement> detail;

  factory BacklogWeekData.fromJson(Map<String, dynamic> json) =>
      BacklogWeekData(
        series: json["series"],
        type: json["type"],
        detail: List<DetailElement>.from(
            json["detail"].map((x) => DetailElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "series": series,
        "type": type,
        "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
      };
}

class DetailElement {
  DetailElement({
    required this.week,
    required this.detail,
    required this.tableHead,
    required this.tableBody,
  });

  String week;
  DetailDetail? detail;
  List<String>? tableHead;
  List<TableBody>? tableBody;

  factory DetailElement.fromJson(Map<String, dynamic> json) => DetailElement(
        week: json["week"] == null ? "null" : json["week"],
        detail: json["detail"] == null
            ? null
            : DetailDetail.fromJson(json["detail"]),
        tableHead: json["table_head"] == null
            ? null
            : List<String>.from(json["table_head"].map((x) => x)),
        tableBody: json["table_body"] == null
            ? null
            : List<TableBody>.from(
                json["table_body"].map((x) => TableBody.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "week": week == null ? "null" : week,
        "detail": detail == null ? null : detail!.toJson(),
        "table_head": tableHead == null
            ? null
            : List<dynamic>.from(tableHead!.map((x) => x)),
        "table_body": tableBody == null
            ? null
            : List<dynamic>.from(tableBody!.map((x) => x.toJson())),
      };
}

class DetailDetail {
  DetailDetail({
    required this.sumclosed,
    required this.sumopen,
    required this.sumbacklog,
  });

  int sumclosed;
  int sumopen;
  int sumbacklog;

  factory DetailDetail.fromJson(Map<String, dynamic> json) => DetailDetail(
        sumclosed: json["sumclosed"],
        sumopen: json["sumopen"],
        sumbacklog: json["sumbacklog"],
      );

  Map<String, dynamic> toJson() => {
        "sumclosed": sumclosed,
        "sumopen": sumopen,
        "sumbacklog": sumbacklog,
      };
}

class TableBody {
  TableBody({
    required this.mtcType,
    required this.backlogDesc,
    required this.finishdate,
  });

  String mtcType;
  String backlogDesc;
  String finishdate;

  factory TableBody.fromJson(Map<String, dynamic> json) => TableBody(
        mtcType: json["mtc_type"],
        backlogDesc: json["backlog_desc"],
        finishdate: json["finishdate"],
      );

  Map<String, dynamic> toJson() => {
        "mtc_type": mtcType,
        "backlog_desc": backlogDesc,
        "finishdate": finishdate,
      };
}
