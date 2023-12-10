// To parse this JSON data, do
//
//     final basedTaskTimeModel = basedTaskTimeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BasedTaskTimeModel basedTaskTimeModelFromJson(String str) =>
    BasedTaskTimeModel.fromJson(json.decode(str));

String basedTaskTimeModelToJson(BasedTaskTimeModel data) =>
    json.encode(data.toJson());

class BasedTaskTimeModel {
  BasedTaskTimeModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  List<BasedTaskTimeData> data;

  factory BasedTaskTimeModel.fromJson(Map<String, dynamic> json) =>
      BasedTaskTimeModel(
        message: json["message"],
        status: json["status"],
        data: List<BasedTaskTimeData>.from(
            json["data"].map((x) => BasedTaskTimeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BasedTaskTimeData {
  BasedTaskTimeData({
    required this.series,
    required this.chart,
  });

  String series;
  ChartBasedTaskTime chart;

  factory BasedTaskTimeData.fromJson(Map<String, dynamic> json) =>
      BasedTaskTimeData(
        series: json["series"],
        chart: ChartBasedTaskTime.fromJson(json["chart"]),
      );

  Map<String, dynamic> toJson() => {
        "series": series,
        "chart": chart.toJson(),
      };
}

class ChartBasedTaskTime {
  ChartBasedTaskTime({
    required this.unit,
    required this.detail,
  });

  Unit unit;
  List<DetailBasedTaskTime> detail;

  factory ChartBasedTaskTime.fromJson(Map<String, dynamic> json) =>
      ChartBasedTaskTime(
        unit: Unit.fromJson(json["unit"]),
        detail: List<DetailBasedTaskTime>.from(
            json["detail"].map((x) => DetailBasedTaskTime.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "unit": unit.toJson(),
        "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
      };
}

class DetailBasedTaskTime {
  DetailBasedTaskTime({
    required this.category,
    required this.value,
    required this.color,
  });

  String category;
  double value;
  String color;

  factory DetailBasedTaskTime.fromJson(Map<String, dynamic> json) =>
      DetailBasedTaskTime(
        category: json["category"],
        value: json["value"].toDouble(),
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "value": value,
        "color": color,
      };
}

class Unit {
  Unit({
    required this.name,
    required this.value,
  });

  String name;
  int value;

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}
