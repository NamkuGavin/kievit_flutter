// To parse this JSON data, do
//
//     final picZoneModel = picZoneModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PicZoneModel picZoneModelFromJson(String str) =>
    PicZoneModel.fromJson(json.decode(str));

String picZoneModelToJson(PicZoneModel data) => json.encode(data.toJson());

class PicZoneModel {
  PicZoneModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  List<PicZoneData> data;

  factory PicZoneModel.fromJson(Map<String, dynamic> json) => PicZoneModel(
        message: json["message"],
        status: json["status"],
        data: List<PicZoneData>.from(
            json["data"].map((x) => PicZoneData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PicZoneData {
  PicZoneData({
    required this.id,
    required this.vccode,
    required this.vcname,
  });

  int id;
  String vccode;
  String vcname;

  factory PicZoneData.fromJson(Map<String, dynamic> json) => PicZoneData(
        id: json["id"],
        vccode: json["vccode"],
        vcname: json["vcname"] == null ? "null" : json["vcname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vccode": vccode,
        "vcname": vcname == null ? "null" : vcname,
      };
}
