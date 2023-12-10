// To parse this JSON data, do
//
//     final mROrderCostDistributionModel = mrOrderCostDistributionModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MROrderCostDistributionModel mrOrderCostDistributionModelFromJson(String str) =>
    MROrderCostDistributionModel.fromJson(json.decode(str));

String mrOrderCostDistributionModelToJson(MROrderCostDistributionModel data) =>
    json.encode(data.toJson());

class MROrderCostDistributionModel {
  MROrderCostDistributionModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  List<MROrderCostDistributionData> data;

  factory MROrderCostDistributionModel.fromJson(Map<String, dynamic> json) =>
      MROrderCostDistributionModel(
        message: json["message"],
        status: json["status"],
        data: List<MROrderCostDistributionData>.from(
            json["data"].map((x) => MROrderCostDistributionData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MROrderCostDistributionData {
  MROrderCostDistributionData({
    required this.ccname,
    required this.detail,
  });

  String ccname;
  Detail detail;

  factory MROrderCostDistributionData.fromJson(Map<String, dynamic> json) =>
      MROrderCostDistributionData(
        ccname: json["ccname"],
        detail: Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "ccname": ccname,
        "detail": detail.toJson(),
      };
}

class Detail {
  Detail({
    required this.value,
    required this.percentage,
  });

  Percentage value;
  Percentage percentage;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        value: Percentage.fromJson(json["value"]),
        percentage: Percentage.fromJson(json["percentage"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value.toJson(),
        "percentage": percentage.toJson(),
      };
}

class Percentage {
  Percentage({
    required this.bdOrder,
    required this.calOrder,
    required this.cmOrder,
    required this.modOrder,
    required this.pmOrder,
  });

  String bdOrder;
  String calOrder;
  String cmOrder;
  String modOrder;
  String pmOrder;

  factory Percentage.fromJson(Map<String, dynamic> json) => Percentage(
        bdOrder: json["BD_Order"],
        calOrder: json["Cal_Order"],
        cmOrder: json["CM_Order"],
        modOrder: json["Mod_Order"],
        pmOrder: json["PM_Order"],
      );

  Map<String, dynamic> toJson() => {
        "BD_Order": bdOrder,
        "Cal_Order": calOrder,
        "CM_Order": cmOrder,
        "Mod_Order": modOrder,
        "PM_Order": pmOrder,
      };
}
