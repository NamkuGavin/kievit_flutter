import 'dart:ffi';

class Chart_model_DailyDowntime {
  int days;
  double totals;
  List detail;

  Chart_model_DailyDowntime(this.days, this.totals, this.detail);

  factory Chart_model_DailyDowntime.fromJson(Map<String, dynamic> data) {
    return Chart_model_DailyDowntime(data['day'], data['total'].toDouble(), data['detail']);
  }
}
