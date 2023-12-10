import 'dart:convert';
import 'dart:io';

import 'package:kievit_flutter/model/model%20Asset%20Budgeting/chart_model_maintenence_cost.dart';
import 'package:kievit_flutter/model/model%20Asset%20Budgeting/chart_model_ytd.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_oee_journey.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_oee_monitoring.dart';
import 'package:kievit_flutter/model/model%20Asset%20Performance/chart_model_primary_and_breakdown_stopped.dart';
import 'package:kievit_flutter/model/model%20Cost%20Analysis/chart_model_comparasion_order.dart';
import 'package:kievit_flutter/model/model%20Cost%20Analysis/chart_model_cost_drivers.dart';
import 'package:kievit_flutter/model/model%20Cost%20Analysis/chart_model_mr_cost.dart';
import 'package:kievit_flutter/model/model%20Cost%20Analysis/chart_model_mr_order.dart';
import 'package:kievit_flutter/model/model%20Cost%20Analysis/chart_model_order_ratio.dart';
import 'package:kievit_flutter/model/model%20Cost%20Registration/chart_model_actual_cost.dart';
import 'package:kievit_flutter/model/model%20Improvment%20Asset/chart_model_pdca_improvment.dart';
import 'package:kievit_flutter/model/model%20Job%20Execution/chart_model_backlog_month.dart';
import 'package:kievit_flutter/model/model%20Job%20Execution/chart_model_backlog_week.dart';
import 'package:kievit_flutter/model/model%20Job%20Execution/chart_model_work_order.dart';
import 'package:kievit_flutter/model/model%20Loss%20Analysis/chart_model_comperative_downtime.dart';
import 'package:kievit_flutter/model/model%20Loss%20Analysis/chart_model_top10_downtime_dtmonitoring.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_daily_downtime.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_supplyfailure_technicalfailurearea.dart';
import 'package:kievit_flutter/model/model%20Loss%20Registration/chart_model_weekly_downtime.dart';
import 'package:kievit_flutter/model/model%20Planning%20Schedule/chart_model_based_on_task_time.dart';
import 'package:kievit_flutter/model/model%20Planning%20Schedule/chart_model_finished_ontime.dart';
import 'package:kievit_flutter/model/model%20Planning%20Schedule/chart_model_planning_review.dart';
import 'package:kievit_flutter/model/model%20Planning%20Schedule/chart_model_work_preparation.dart';
import 'package:kievit_flutter/shared/url.dart';
import 'package:http/http.dart' as http;

class ChartApi {
  List<Chart_model_OEEMonitoring> data = [];
  List<Chart_model_PrimaryAndBreakdown_Stopped> data2 = [];
  List<Chart_model_SupplyFailureTechnicalFailureArea> data3 = [];
  List<Chart_model_WeeklyDowntime> data4 = [];
  List<Chart_model_DailyDowntime> data5 = [];
  List<Chart_model_Top10Downtime_DTMonitoring> data6 = [];
  List<Chart_model_Comperative_Downtime> data7 = [];
  Chart_model_PDCA_Improvment? _chartmodel_pdca_improvment;

  final url = Url.url;

  Future<OeeJourneyModel> getChartFromApi_OEEJourney(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return OeeJourneyModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }

  Future<List<Chart_model_OEEMonitoring>> getChartFromApi_OEEMonitoring(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    Map<String, dynamic> body = jsonDecode(request.body);
    if (request.statusCode == 200) {
      List dataApi = body['data'];
      for (int i = 0; i < dataApi.length; i++) {
        data.add(Chart_model_OEEMonitoring.fromJson(dataApi[i]));
      }
      print(data);
      return data;
    } else {
      return data;
    }
  }

  Future<List<Chart_model_PrimaryAndBreakdown_Stopped>>
      getChartFromApi_PrimaryBreakdown(String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    Map<String, dynamic> body = jsonDecode(request.body);
    if (request.statusCode == 200) {
      List dataApi = body['data'];

      for (int i = 0; i < dataApi.length; i++) {
        data2.add(Chart_model_PrimaryAndBreakdown_Stopped.fromJson(dataApi[i]));
      }
      print(data2);
      return data2;
    } else {
      return data2;
    }
  }

  Future<List<Chart_model_SupplyFailureTechnicalFailureArea>>
      getChartFromApi_SupplyFailureTechnicalFailureArea(
          String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    Map<String, dynamic> body = jsonDecode(request.body);
    if (request.statusCode == 200) {
      List dataApi = body['data'];

      for (int i = 0; i < dataApi.length; i++) {
        data3.add(
            Chart_model_SupplyFailureTechnicalFailureArea.fromJson(dataApi[i]));
      }
      print(data3);
      return data3;
    } else {
      return data3;
    }
  }

  Future<List<Chart_model_WeeklyDowntime>> getChartFromApi_WeeklyDowntime(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    Map<String, dynamic> body = jsonDecode(request.body);
    if (request.statusCode == 200) {
      List dataApi = body['data'];

      for (int i = 0; i < dataApi.length; i++) {
        data4.add(Chart_model_WeeklyDowntime.fromJson(dataApi[i]));
      }
      print(data4);
      return data4;
    } else {
      return data4;
    }
  }

  Future<List<Chart_model_DailyDowntime>> getChartFromApi_DailyDowntime(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    Map<String, dynamic> body = jsonDecode(request.body);
    if (request.statusCode == 200) {
      List dataApi = body['data'];

      for (int i = 0; i < dataApi.length; i++) {
        data5.add(Chart_model_DailyDowntime.fromJson(dataApi[i]));
      }
      print(data5);
      return data5;
    } else {
      return data5;
    }
  }

  Future<List<Chart_model_Top10Downtime_DTMonitoring>>
      getChartFromApi_Top10Downtime_DTMonitoring(
          String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    Map<String, dynamic> body = jsonDecode(request.body);
    if (request.statusCode == 200) {
      List dataApi = body['data'];

      for (int i = 0; i < dataApi.length; i++) {
        data6.add(Chart_model_Top10Downtime_DTMonitoring.fromJson(dataApi[i]));
      }
      print(data6);
      return data6;
    } else {
      return data6;
    }
  }

  Future<List<Chart_model_Comperative_Downtime>>
      getChartFromApi_Comperative_Downtime(String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    Map<String, dynamic> body = jsonDecode(request.body);
    if (request.statusCode == 200) {
      List dataApi = body['data'];

      for (int i = 0; i < dataApi.length; i++) {
        data7.add(Chart_model_Comperative_Downtime.fromJson(dataApi[i]));
      }
      print(data7);
      return data7;
    } else {
      return data7;
    }
  }

  getChartFromApi_PDCA_Improvment(String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    _chartmodel_pdca_improvment = Chart_model_PDCA_Improvment.fromJson(
        json.decode(request.body.toString()));
    if (request.statusCode == 200) {
      print(_chartmodel_pdca_improvment);
      return _chartmodel_pdca_improvment;
    } else {
      return _chartmodel_pdca_improvment;
    }
  }

  Future<BacklogMonthModel> getChartFromApi_Backlog_Month(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return BacklogMonthModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }

  Future<BacklogWeekModel> getChartFromApi_Backlog_Week(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return BacklogWeekModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }

  Future<WorkPreparationModel> getChartFromApi_WorkPreparation(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return WorkPreparationModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }

  Future<PlanningReviewModel> getChartFromApi_PlanningReview(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return PlanningReviewModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }

  Future<BasedTaskTimeModel> getChartFromApi_BasedTaskTime(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return BasedTaskTimeModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }

  Future<FinishedOntimeModel> getChartFromApi_FinishedOntime(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return FinishedOntimeModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }

  Future<WorkOrderModel> getChartFromApi_WorkOrder(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return WorkOrderModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }

  Future<MaintenenceCostModel> getChartFromApi_MaintenenceCost(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return MaintenenceCostModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }

  Future<ActualCostCentrePerMonthModel>
      getChartFromApi_ActualCostCentrePerMonth(
          String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return ActualCostCentrePerMonthModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }

  Future<YtdRealizationKUsdModel> getChartFromApi_YtdRealization(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return YtdRealizationKUsdModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }

  Future<CostDriversVcBudgetModel> getChartFromApi_CostDriversVcBudget(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return CostDriversVcBudgetModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }

  Future<MROrderCostDistributionModel> getChartFromApi_MROrderCostDistribution(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return MROrderCostDistributionModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }

  Future<MRCostPerZonePicModel> getChartFromApi_MRCostPerZonePic(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return MRCostPerZonePicModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }

  Future<ComparisonPmOrderVsCmOrderModel>
      getChartFromApi_ComparisonPmOrderVsCmOrder(
          String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return ComparisonPmOrderVsCmOrderModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }

  Future<PmOrderRatioModel> getChartFromApi_PmOrderRatio(
      String vcurl, String token) async {
    final getUrl = url + vcurl;
    print(getUrl);
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final request = await http.get(
      Uri.parse(getUrl),
      headers: headers,
    );
    if (request.statusCode == 200) {
      return PmOrderRatioModel.fromJson(jsonDecode(request.body));
    } else {
      print(request.statusCode);
      throw HttpException('request error code ${request.statusCode}');
    }
  }
}
