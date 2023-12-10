// To parse this JSON data, do
//
//     final ccnameModel = ccnameModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CcnameModel ccnameModelFromJson(String str) =>
    CcnameModel.fromJson(json.decode(str));

String ccnameModelToJson(CcnameModel data) => json.encode(data.toJson());

class CcnameModel {
  CcnameModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  List<CcnameData> data;

  factory CcnameModel.fromJson(Map<String, dynamic> json) => CcnameModel(
        message: json["message"],
        status: json["status"],
        data: List<CcnameData>.from(
            json["data"].map((x) => CcnameData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CcnameData {
  CcnameData({
    required this.id,
    required this.vcname,
  });

  int id;
  String vcname;

  factory CcnameData.fromJson(Map<String, dynamic> json) => CcnameData(
        id: json["id"],
        vcname: json["vcname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vcname": vcname,
      };
}
