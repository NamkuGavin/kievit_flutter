// To parse this JSON data, do
//
//     final comparisonPmOrderVsCmOrderModel = comparisonPmOrderVsCmOrderModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ComparisonPmOrderVsCmOrderModel comparisonPmOrderVsCmOrderModelFromJson(
        String str) =>
    ComparisonPmOrderVsCmOrderModel.fromJson(json.decode(str));

String comparisonPmOrderVsCmOrderModelToJson(
        ComparisonPmOrderVsCmOrderModel data) =>
    json.encode(data.toJson());

class ComparisonPmOrderVsCmOrderModel {
  ComparisonPmOrderVsCmOrderModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  List<ComparisonPmOrderVsCmOrderData> data;

  factory ComparisonPmOrderVsCmOrderModel.fromJson(Map<String, dynamic> json) =>
      ComparisonPmOrderVsCmOrderModel(
        message: json["message"],
        status: json["status"],
        data: List<ComparisonPmOrderVsCmOrderData>.from(json["data"]
            .map((x) => ComparisonPmOrderVsCmOrderData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ComparisonPmOrderVsCmOrderData {
  ComparisonPmOrderVsCmOrderData({
    required this.month,
    required this.detail,
  });

  String month;
  Detail detail;

  factory ComparisonPmOrderVsCmOrderData.fromJson(Map<String, dynamic> json) =>
      ComparisonPmOrderVsCmOrderData(
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

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
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
