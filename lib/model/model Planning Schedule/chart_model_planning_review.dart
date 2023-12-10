// To parse this JSON data, do
//
//     final planningReviewModel = planningReviewModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PlanningReviewModel planningReviewModelFromJson(String str) =>
    PlanningReviewModel.fromJson(json.decode(str));

String planningReviewModelToJson(PlanningReviewModel data) =>
    json.encode(data.toJson());

class PlanningReviewModel {
  PlanningReviewModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  PlanningReviewData data;

  factory PlanningReviewModel.fromJson(Map<String, dynamic> json) =>
      PlanningReviewModel(
        message: json["message"],
        status: json["status"],
        data: PlanningReviewData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class PlanningReviewData {
  PlanningReviewData({
    required this.series,
    required this.chart,
  });

  String series;
  List<ChartPlanningReview> chart;

  factory PlanningReviewData.fromJson(Map<String, dynamic> json) =>
      PlanningReviewData(
        series: json["series"],
        chart: List<ChartPlanningReview>.from(
            json["chart"].map((x) => ChartPlanningReview.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "series": series,
        "chart": List<dynamic>.from(chart.map((x) => x.toJson())),
      };
}

class ChartPlanningReview {
  ChartPlanningReview({
    required this.category,
    required this.value,
    required this.color,
  });

  String category;
  double value;
  String color;

  factory ChartPlanningReview.fromJson(Map<String, dynamic> json) =>
      ChartPlanningReview(
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
