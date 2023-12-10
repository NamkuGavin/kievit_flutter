// To parse this JSON data, do
//
//     final titleModel = titleModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TitleModel titleModelFromJson(String str) =>
    TitleModel.fromJson(json.decode(str));

String titleModelToJson(TitleModel data) => json.encode(data.toJson());

class TitleModel {
  TitleModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  List<TitleData> data;

  factory TitleModel.fromJson(Map<String, dynamic> json) => TitleModel(
        message: json["message"],
        status: json["status"],
        data: List<TitleData>.from(
            json["data"].map((x) => TitleData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TitleData {
  TitleData({
    required this.id,
    required this.vcjudul,
  });

  int id;
  String vcjudul;

  factory TitleData.fromJson(Map<String, dynamic> json) => TitleData(
        id: json["id"],
        vcjudul: json["vcjudul"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vcjudul": vcjudul,
      };
}
