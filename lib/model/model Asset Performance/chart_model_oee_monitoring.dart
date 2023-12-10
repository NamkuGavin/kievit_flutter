class Chart_model_OEEMonitoring {
  String months;
  List value;

  Chart_model_OEEMonitoring(this.months, this.value);

  factory Chart_model_OEEMonitoring.fromJson(Map<String, dynamic> data) {
    return Chart_model_OEEMonitoring(data['month'], data['value']);
  }
}
