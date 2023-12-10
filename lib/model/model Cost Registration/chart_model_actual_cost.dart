// To parse this JSON data, do
//
//     final actualCostCentrePerMonthModel = actualCostCentrePerMonthModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ActualCostCentrePerMonthModel actualCostCentrePerMonthModelFromJson(
        String str) =>
    ActualCostCentrePerMonthModel.fromJson(json.decode(str));

String actualCostCentrePerMonthModelToJson(
        ActualCostCentrePerMonthModel data) =>
    json.encode(data.toJson());

class ActualCostCentrePerMonthModel {
  ActualCostCentrePerMonthModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  ActualCostCentrePerMonthData data;

  factory ActualCostCentrePerMonthModel.fromJson(Map<String, dynamic> json) =>
      ActualCostCentrePerMonthModel(
        message: json["message"],
        status: json["status"],
        data: ActualCostCentrePerMonthData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class ActualCostCentrePerMonthData {
  ActualCostCentrePerMonthData({
    required this.series,
    required this.chart,
  });

  String series;
  List<ActualCostCentrePerMonthChart> chart;

  factory ActualCostCentrePerMonthData.fromJson(Map<String, dynamic> json) =>
      ActualCostCentrePerMonthData(
        series: json["series"],
        chart: List<ActualCostCentrePerMonthChart>.from(json["chart"]
            .map((x) => ActualCostCentrePerMonthChart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "series": series,
        "chart": List<dynamic>.from(chart.map((x) => x.toJson())),
      };
}

class ActualCostCentrePerMonthChart {
  ActualCostCentrePerMonthChart({
    required this.month,
    required this.total,
    required this.detail,
  });

  String month;
  double total;
  List<Detail> detail;

  factory ActualCostCentrePerMonthChart.fromJson(Map<String, dynamic> json) =>
      ActualCostCentrePerMonthChart(
        month: json["month"],
        total: json["total"]?.toDouble(),
        detail:
            List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "total": total,
        "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    required this.ccname,
    required this.value,
  });

  String ccname;
  double value;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        ccname: json["ccname"],
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "ccname": ccname,
        "value": value,
      };
}
