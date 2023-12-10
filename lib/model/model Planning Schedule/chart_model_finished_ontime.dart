// To parse this JSON data, do
//
//     final finishedOntimeModel = finishedOntimeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FinishedOntimeModel finishedOntimeModelFromJson(String str) =>
    FinishedOntimeModel.fromJson(json.decode(str));

String finishedOntimeModelToJson(FinishedOntimeModel data) =>
    json.encode(data.toJson());

class FinishedOntimeModel {
  FinishedOntimeModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  List<FinishedOntimeData> data;

  factory FinishedOntimeModel.fromJson(Map<String, dynamic> json) =>
      FinishedOntimeModel(
        message: json["message"],
        status: json["status"],
        data: List<FinishedOntimeData>.from(
            json["data"].map((x) => FinishedOntimeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FinishedOntimeData {
  FinishedOntimeData({
    required this.series,
    required this.chart,
  });

  String series;
  List<FinishedOntimeChart> chart;

  factory FinishedOntimeData.fromJson(Map<String, dynamic> json) =>
      FinishedOntimeData(
        series: json["series"],
        chart: List<FinishedOntimeChart>.from(
            json["chart"].map((x) => FinishedOntimeChart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "series": series,
        "chart": List<dynamic>.from(chart.map((x) => x.toJson())),
      };
}

class FinishedOntimeChart {
  FinishedOntimeChart({
    required this.week,
    required this.detail,
    required this.totalcount,
    required this.totalsum,
    required this.accuracy,
  });

  String week;
  Detail? detail;
  int totalcount;
  int totalsum;
  double accuracy;

  factory FinishedOntimeChart.fromJson(Map<String, dynamic> json) =>
      FinishedOntimeChart(
        week: json["week"] == null ? "null" : json["week"],
        detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
        totalcount: json["totalcount"] == null ? 0 : json["totalcount"],
        totalsum: json["totalsum"] == null ? 0 : json["totalsum"],
        accuracy: json["accuracy"] == null ? 0.0 : json["accuracy"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "week": week == null ? "null" : week,
        "detail": detail == null ? null : detail!.toJson(),
        "totalcount": totalcount == null ? 0 : totalcount,
        "totalsum": totalsum == null ? 0 : totalsum,
        "accuracy": accuracy == null ? 0.0 : accuracy,
      };
}

class Detail {
  Detail({
    required this.countontime,
    required this.sumontime,
    required this.accuracy,
  });

  String countontime;
  int sumontime;
  double accuracy;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        countontime: json["countontime"],
        sumontime: json["sumontime"],
        accuracy: json["accuracy"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "countontime": countontime,
        "sumontime": sumontime,
        "accuracy": accuracy,
      };
}
