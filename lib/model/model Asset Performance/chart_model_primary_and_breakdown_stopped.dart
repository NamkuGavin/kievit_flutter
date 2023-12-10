class Chart_model_PrimaryAndBreakdown_Stopped {
  String years;
  double totals;
  List detail;

  Chart_model_PrimaryAndBreakdown_Stopped(this.years, this.totals, this.detail);

  factory Chart_model_PrimaryAndBreakdown_Stopped.fromJson(
      Map<String, dynamic> data) {
    return Chart_model_PrimaryAndBreakdown_Stopped(
        data['year'], data['total_stop'].toDouble(), data['detail']);
  }
}
