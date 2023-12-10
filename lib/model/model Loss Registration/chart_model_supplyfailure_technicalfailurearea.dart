class Chart_model_SupplyFailureTechnicalFailureArea {
  String years;
  double totals;
  List detail;

  Chart_model_SupplyFailureTechnicalFailureArea(this.years, this.totals, this.detail);

  factory Chart_model_SupplyFailureTechnicalFailureArea.fromJson(Map<String, dynamic> data) {
    return Chart_model_SupplyFailureTechnicalFailureArea(data['year'], data['total'].toDouble(), data['detail']);
  }
}
