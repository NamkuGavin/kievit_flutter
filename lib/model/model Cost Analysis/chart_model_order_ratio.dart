// To parse this JSON data, do
//
//     final pmOrderRatioModel = pmOrderRatioModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PmOrderRatioModel pmOrderRatioModelFromJson(String str) =>
    PmOrderRatioModel.fromJson(json.decode(str));

String pmOrderRatioModelToJson(PmOrderRatioModel data) =>
    json.encode(data.toJson());

class PmOrderRatioModel {
  PmOrderRatioModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  List<PmOrderRatioData> data;

  factory PmOrderRatioModel.fromJson(Map<String, dynamic> json) =>
      PmOrderRatioModel(
        message: json["message"],
        status: json["status"],
        data: List<PmOrderRatioData>.from(
            json["data"].map((x) => PmOrderRatioData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PmOrderRatioData {
  PmOrderRatioData({
    required this.name,
    required this.value,
  });

  String name;
  double value;

  factory PmOrderRatioData.fromJson(Map<String, dynamic> json) =>
      PmOrderRatioData(
        name: json["name"],
        value: json["value"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}
