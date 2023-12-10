// To parse this JSON data, do
//
//     final costDriversVcBudgetModel = costDriversVcBudgetModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CostDriversVcBudgetModel costDriversVcBudgetModelFromJson(String str) =>
    CostDriversVcBudgetModel.fromJson(json.decode(str));

String costDriversVcBudgetModelToJson(CostDriversVcBudgetModel data) =>
    json.encode(data.toJson());

class CostDriversVcBudgetModel {
  CostDriversVcBudgetModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  List<CostDriversVcBudgetData> data;

  factory CostDriversVcBudgetModel.fromJson(Map<String, dynamic> json) =>
      CostDriversVcBudgetModel(
        message: json["message"],
        status: json["status"],
        data: List<CostDriversVcBudgetData>.from(
            json["data"].map((x) => CostDriversVcBudgetData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CostDriversVcBudgetData {
  CostDriversVcBudgetData({
    required this.ccname,
    required this.detail,
  });

  String ccname;
  List<CostDriversVcBudgetDetail> detail;

  factory CostDriversVcBudgetData.fromJson(Map<String, dynamic> json) =>
      CostDriversVcBudgetData(
        ccname: json["ccname"],
        detail: List<CostDriversVcBudgetDetail>.from(
            json["detail"].map((x) => CostDriversVcBudgetDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ccname": ccname,
        "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
      };
}

class CostDriversVcBudgetDetail {
  CostDriversVcBudgetDetail({
    required this.budget,
    required this.realization,
  });

  String budget;
  String realization;

  factory CostDriversVcBudgetDetail.fromJson(Map<String, dynamic> json) =>
      CostDriversVcBudgetDetail(
        budget: json["budget"],
        realization: json["realization"] == null ? "0" : json["realization"],
      );

  Map<String, dynamic> toJson() => {
        "budget": budget,
        "realization": realization == null ? "0" : realization,
      };
}
