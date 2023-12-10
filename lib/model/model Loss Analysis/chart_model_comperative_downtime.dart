// class Chart_model_Comperative_Downtime {
//   String index;
//   List detail;
//
//   Chart_model_Comperative_Downtime(this.index, this.detail);
//
//   factory Chart_model_Comperative_Downtime.fromJson(Map<String, dynamic> data) {
//     return Chart_model_Comperative_Downtime(data['index'], data['detail']);
//   }
// }

class Chart_model_Comperative_Downtime {
  Chart_model_Comperative_Downtime({
    required this.index,
    required this.detail,
  });

  String index;
  Detail detail;

  factory Chart_model_Comperative_Downtime.fromJson(
          Map<String, dynamic> json) =>
      Chart_model_Comperative_Downtime(
        index: json["index"],
        detail: Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "detail": detail.toJson(),
      };
}

class Detail {
  Detail({
    required this.low,
    required this.high,
    required this.status,
    required this.color,
  });

  int low;
  int high;
  String status;
  String color;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        low: json["low"],
        high: json["high"],
        status: json["status"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "low": low,
        "high": high,
        "status": status,
        "color": color,
      };
}
