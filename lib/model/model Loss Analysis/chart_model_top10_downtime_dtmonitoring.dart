class Chart_model_Top10Downtime_DTMonitoring {
  String names;
  List detail;

  Chart_model_Top10Downtime_DTMonitoring(this.names, this.detail);

  factory Chart_model_Top10Downtime_DTMonitoring.fromJson(
      Map<String, dynamic> data) {
    return Chart_model_Top10Downtime_DTMonitoring(data['name'], data['detail']);
  }
}
