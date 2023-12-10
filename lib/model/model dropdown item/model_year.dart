// To parse this JSON data, do
//
//     final yearModel = yearModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

YearModel yearModelFromJson(String str) => YearModel.fromJson(json.decode(str));

String yearModelToJson(YearModel data) => json.encode(data.toJson());

class YearModel {
  YearModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  List<YearData> data;

  factory YearModel.fromJson(Map<String, dynamic> json) => YearModel(
        message: json["message"],
        status: json["status"],
        data:
            List<YearData>.from(json["data"].map((x) => YearData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class YearData {
  YearData({
    required this.id,
    required this.vcname,
  });

  int id;
  int vcname;

  factory YearData.fromJson(Map<String, dynamic> json) => YearData(
        id: json["id"],
        vcname: json["vcname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vcname": vcname,
      };
}
