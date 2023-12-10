// To parse this JSON data, do
//
//     final chartModelPdcaImprovment = chartModelPdcaImprovmentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Chart_model_PDCA_Improvment chartModelPdcaImprovmentFromJson(String str) =>
    Chart_model_PDCA_Improvment.fromJson(json.decode(str));

String chartModelPdcaImprovmentToJson(Chart_model_PDCA_Improvment data) =>
    json.encode(data.toJson());

class Chart_model_PDCA_Improvment {
  Chart_model_PDCA_Improvment({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  Data data;

  factory Chart_model_PDCA_Improvment.fromJson(Map<String, dynamic> json) =>
      Chart_model_PDCA_Improvment(
        message: json["message"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.year,
    required this.issueRca,
    required this.possibleCause,
    required this.plan,
    required this.check,
    required this.dataDo,
    required this.action,
  });

  String year;
  String issueRca;
  String possibleCause;
  String plan;
  String check;
  List<Action> dataDo;
  List<Action> action;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        year: json["year"],
        issueRca: json["issue_rca"],
        possibleCause: json["possible_cause"],
        plan: json["plan"],
        check: json["check"],
        dataDo: List<Action>.from(json["do"].map((x) => Action.fromJson(x))),
        action:
            List<Action>.from(json["action"].map((x) => Action.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "issue_rca": issueRca,
        "possible_cause": possibleCause,
        "plan": plan,
        "check": check,
        "do": List<dynamic>.from(dataDo.map((x) => x.toJson())),
        "action": List<dynamic>.from(action.map((x) => x.toJson())),
      };
}

class Action {
  Action({
    required this.value,
    required this.pic,
    required this.dueDate,
    required this.status,
  });

  String value;
  String pic;
  String dueDate;
  String status;

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        value: json["value"],
        pic: json["pic"],
        dueDate: json["due_date"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "pic": pic,
        "due_date": dueDate,
        "status": status,
      };
}
