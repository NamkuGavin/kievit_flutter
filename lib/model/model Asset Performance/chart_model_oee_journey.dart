// To parse this JSON data, do
//
//     final oeeJourneyModel = oeeJourneyModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OeeJourneyModel oeeJourneyModelFromJson(String str) => OeeJourneyModel.fromJson(json.decode(str));

String oeeJourneyModelToJson(OeeJourneyModel data) => json.encode(data.toJson());

class OeeJourneyModel {
  OeeJourneyModel({
    required this.message,
    required this.status,
    required this.reference,
    required this.data,
  });

  String message;
  String status;
  Reference reference;
  List<OeeJourneyData> data;

  factory OeeJourneyModel.fromJson(Map<String, dynamic> json) => OeeJourneyModel(
    message: json["message"],
    status: json["status"],
    reference: Reference.fromJson(json["reference"]),
    data: List<OeeJourneyData>.from(json["data"].map((x) => OeeJourneyData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "reference": reference.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class OeeJourneyData {
  OeeJourneyData({
    required this.year,
    required this.value,
  });

  String year;
  List<Value> value;

  factory OeeJourneyData.fromJson(Map<String, dynamic> json) => OeeJourneyData(
    year: json["year"],
    value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "year": year,
    "value": List<dynamic>.from(value.map((x) => x.toJson())),
  };
}

class Value {
  Value({
    required this.tower,
    required this.oee,
  });

  Tower? tower;
  double oee;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    tower: towerValues.map[json["tower"]],
    oee: json["oee"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "tower": towerValues.reverse[tower],
    "oee": oee,
  };
}

enum Tower { S1, S2 }

final towerValues = EnumValues({
  "S1": Tower.S1,
  "S2": Tower.S2
});

class Reference {
  Reference({
    required this.minyear,
    required this.maxyear,
  });

  String minyear;
  String maxyear;

  factory Reference.fromJson(Map<String, dynamic> json) => Reference(
    minyear: json["minyear"],
    maxyear: json["maxyear"],
  );

  Map<String, dynamic> toJson() => {
    "minyear": minyear,
    "maxyear": maxyear,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
