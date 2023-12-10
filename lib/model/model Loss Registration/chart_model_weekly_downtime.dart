class Chart_model_WeeklyDowntime {
  int weeks;
  double totals;
  List detail;

  Chart_model_WeeklyDowntime(this.weeks, this.totals, this.detail);

  factory Chart_model_WeeklyDowntime.fromJson(Map<String, dynamic> data) {
    return Chart_model_WeeklyDowntime(
        data['week'], data['total'].toDouble(), data['detail']);
  }
}
