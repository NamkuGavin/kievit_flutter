// To parse this JSON data, do
//
//     final ytdRealizationKUsdModel = ytdRealizationKUsdModelFromJson(jsonString);

import 'dart:convert';

YtdRealizationKUsdModel ytdRealizationKUsdModelFromJson(String str) =>
    YtdRealizationKUsdModel.fromJson(json.decode(str));

String ytdRealizationKUsdModelToJson(YtdRealizationKUsdModel data) =>
    json.encode(data.toJson());

class YtdRealizationKUsdModel {
  YtdRealizationKUsdModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  List<YtdRealizationKUsdData> data;

  factory YtdRealizationKUsdModel.fromJson(Map<String, dynamic> json) =>
      YtdRealizationKUsdModel(
        message: json["message"],
        status: json["status"],
        data: List<YtdRealizationKUsdData>.from(
            json["data"].map((x) => YtdRealizationKUsdData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class YtdRealizationKUsdData {
  YtdRealizationKUsdData({
    required this.series,
    required this.chart,
  });

  String series;
  List<YtdRealizationKUsdChart> chart;

  factory YtdRealizationKUsdData.fromJson(Map<String, dynamic> json) =>
      YtdRealizationKUsdData(
        series: json["series"],
        chart: List<YtdRealizationKUsdChart>.from(
            json["chart"].map((x) => YtdRealizationKUsdChart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "series": series,
        "chart": List<dynamic>.from(chart.map((x) => x.toJson())),
      };
}

class YtdRealizationKUsdChart {
  YtdRealizationKUsdChart({
    this.legend,
    this.detail,
    this.budget,
  });

  String? legend;
  Detail? detail;
  double? budget;

  factory YtdRealizationKUsdChart.fromJson(Map<String, dynamic> json) =>
      YtdRealizationKUsdChart(
        legend: json["legend"],
        detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
        budget: json["budget"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "legend": legend,
        "detail": detail?.toJson(),
        "budget": budget,
      };
}

class Detail {
  Detail({
    required this.value,
    required this.percentage,
  });

  int value;
  double percentage;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        value: json["value"],
        percentage: json["percentage"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "percentage": percentage,
      };
}
