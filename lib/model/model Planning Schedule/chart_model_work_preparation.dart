// To parse this JSON data, do
//
//     final workPreparationModel = workPreparationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

WorkPreparationModel workPreparationModelFromJson(String str) =>
    WorkPreparationModel.fromJson(json.decode(str));

String workPreparationModelToJson(WorkPreparationModel data) =>
    json.encode(data.toJson());

class WorkPreparationModel {
  WorkPreparationModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  List<WorkPreparationData> data;

  factory WorkPreparationModel.fromJson(Map<String, dynamic> json) =>
      WorkPreparationModel(
        message: json["message"],
        status: json["status"],
        data: List<WorkPreparationData>.from(
            json["data"].map((x) => WorkPreparationData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WorkPreparationData {
  WorkPreparationData({
    required this.series,
    required this.chart,
  });

  String series;
  List<Chart> chart;

  factory WorkPreparationData.fromJson(Map<String, dynamic> json) =>
      WorkPreparationData(
        series: json["series"],
        chart: List<Chart>.from(json["chart"].map((x) => Chart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "series": series,
        "chart": List<dynamic>.from(chart.map((x) => x.toJson())),
      };
}

class Chart {
  Chart({
    required this.point,
    required this.detail,
  });

  String point;
  Detail detail;

  factory Chart.fromJson(Map<String, dynamic> json) => Chart(
        point: json["point"],
        detail: Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "point": point,
        "detail": detail.toJson(),
      };
}

class Detail {
  Detail({
    required this.value,
    required this.percentage,
  });

  int value;
  double percentage;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        value: json["value"],
        percentage: json["percentage"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "percentage": percentage,
      };
}
