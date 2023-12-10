// To parse this JSON data, do
//
//     final assetCostBudgetingModel = assetCostBudgetingModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MaintenenceCostModel assetCostBudgetingModelFromJson(String str) =>
    MaintenenceCostModel.fromJson(json.decode(str));

String assetCostBudgetingModelToJson(MaintenenceCostModel data) =>
    json.encode(data.toJson());

class MaintenenceCostModel {
  MaintenenceCostModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  AssetCostBudgetingData data;

  factory MaintenenceCostModel.fromJson(Map<String, dynamic> json) =>
      MaintenenceCostModel(
        message: json["message"],
        status: json["status"],
        data: AssetCostBudgetingData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class AssetCostBudgetingData {
  AssetCostBudgetingData({
    required this.series,
    required this.chart,
  });

  String series;
  List<AssetCostBudgetingChart> chart;

  factory AssetCostBudgetingData.fromJson(Map<String, dynamic> json) =>
      AssetCostBudgetingData(
        series: json["series"],
        chart: List<AssetCostBudgetingChart>.from(
            json["chart"].map((x) => AssetCostBudgetingChart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "series": series,
        "chart": List<dynamic>.from(chart.map((x) => x.toJson())),
      };
}

class AssetCostBudgetingChart {
  AssetCostBudgetingChart({
    required this.month,
    required this.detail,
  });

  String month;
  Detail detail;

  factory AssetCostBudgetingChart.fromJson(Map<String, dynamic> json) =>
      AssetCostBudgetingChart(
        month: json["month"],
        detail: Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "detail": detail.toJson(),
      };
}

class Detail {
  Detail({
    required this.budget,
    required this.cost,
    required this.partcost,
    required this.servicecost,
    required this.ytd,
  });

  num budget;
  num cost;
  num partcost;
  num servicecost;
  num ytd;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        budget: json["budget"],
        cost: json["cost"],
        partcost: json["partcost"],
        servicecost: json["servicecost"],
        ytd: json["ytd"],
      );

  Map<String, dynamic> toJson() => {
        "budget": budget,
        "cost": cost,
        "partcost": partcost,
        "servicecost": servicecost,
        "ytd": ytd,
      };
}
