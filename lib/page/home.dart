import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kievit_flutter/chart_component/chart_Asset_Budgeting/chart_component_maintenence_cost.dart';
import 'package:kievit_flutter/chart_component/chart_Asset_Budgeting/chart_component_ytd.dart';
import 'package:kievit_flutter/chart_component/chart_Asset_Performance/chart_component_breakdownstopped.dart';
import 'package:kievit_flutter/chart_component/chart_Cost_Analisis/chart_component_comparasion_order.dart';
import 'package:kievit_flutter/chart_component/chart_Cost_Analisis/chart_component_cost_drivers.dart';
import 'package:kievit_flutter/chart_component/chart_Cost_Analisis/chart_component_mr_cost.dart';
import 'package:kievit_flutter/chart_component/chart_Cost_Analisis/chart_component_mr_order.dart';
import 'package:kievit_flutter/chart_component/chart_Cost_Analisis/chart_component_order_ratio.dart';
import 'package:kievit_flutter/chart_component/chart_Cost_Registration/chart_component_actual_cost.dart';
import 'package:kievit_flutter/chart_component/chart_Imrovment_Asset/chart_component_pdca_improvment.dart';
import 'package:kievit_flutter/chart_component/chart_Job_Execution/chart_component_backlog_month.dart';
import 'package:kievit_flutter/chart_component/chart_Job_Execution/chart_component_backlog_week.dart';
import 'package:kievit_flutter/chart_component/chart_Job_Execution/chart_component_work_order.dart';
import 'package:kievit_flutter/chart_component/chart_Loss_Analysis/chart_component_comperativedowntime.dart';
import 'package:kievit_flutter/chart_component/chart_Loss_Analysis/chart_component_top10downtime.dart';
import 'package:kievit_flutter/chart_component/chart_Loss_Analysis/chart_component_top10dtmonitoring.dart';
import 'package:kievit_flutter/chart_component/chart_Loss_Registration/chart_component_dailydowntime.dart';
import 'package:kievit_flutter/chart_component/chart_Asset_Performance/chart_component_oeejourney.dart';
import 'package:kievit_flutter/chart_component/chart_Asset_Performance/chart_component_oeemonitoring.dart';
import 'package:kievit_flutter/chart_component/chart_Asset_Performance/chart_component_primarystopped.dart';
import 'package:kievit_flutter/chart_component/chart_Loss_Registration/chart_component_supplyfailure.dart';
import 'package:kievit_flutter/chart_component/chart_Loss_Registration/chart_component_technicalfailurearea.dart';
import 'package:kievit_flutter/chart_component/chart_Loss_Registration/chart_component_weeklydowntime.dart';
import 'package:kievit_flutter/chart_component/chart_Planning_Schedule/chart_component_based_on_task_time.dart';
import 'package:kievit_flutter/chart_component/chart_Planning_Schedule/chart_component_finished_ontime.dart';
import 'package:kievit_flutter/chart_component/chart_Planning_Schedule/chart_component_planning_review.dart';
import 'package:kievit_flutter/chart_component/chart_planning_schedule/chart_component_work_preparation.dart';
import 'package:kievit_flutter/model/comment_model.dart';
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
import 'package:kievit_flutter/model/model%20dropdown%20item/model_ccname.dart';
import 'package:kievit_flutter/model/model%20dropdown%20item/model_pic_zone.dart';
import 'package:kievit_flutter/model/model%20dropdown%20item/model_title.dart';
import 'package:kievit_flutter/model/model%20dropdown%20item/model_year.dart';
import 'package:kievit_flutter/model/user_model.dart';
import 'package:kievit_flutter/network/login_api.dart';
import 'package:kievit_flutter/page/comment.dart';
import 'package:kievit_flutter/page/profile.dart';
import 'package:kievit_flutter/shared/color_values.dart';
import 'package:kievit_flutter/shared/custom_radio_button.dart';
import 'package:kievit_flutter/shared/shared_code.dart';
import 'package:kievit_flutter/shared/waringdialog.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../network/chart_api.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final _listController = CarouselController();
  PicZoneModel? _picZoneModel;
  PicZoneData? dropdownPicZone;
  List<PicZoneData>? piczoneList;
  CcnameModel? _ccNameModel;
  CcnameData? dropdownCcName;
  List<CcnameData>? ccNameList;
  YearModel? _yearModel;
  YearData? dropdownYear;
  List<YearData>? yearList;
  TitleModel? _titleModel;
  TitleData? dropdownTitle;
  List<TitleData>? titleList;
  List<TitleData> dataTitle = [];
  String? dropdownTower;
  List? towerList;
  String? dropdownMonth;
  List? monthList;
  List<dynamic> menuContent = [];
  List<dynamic> menuContentChildrens = [];
  List<dynamic> menuContentSubChildrens = [];
  List<Chart_model_OEEMonitoring> dataChartOEEMonitoring = [];
  List<Chart_model_PrimaryAndBreakdown_Stopped>
      dataChartPrimaryBreakdownStopped = [];
  List<Chart_model_SupplyFailureTechnicalFailureArea>
      dataChartSupplyFailureTechnicalFailureArea = [];
  List<Chart_model_WeeklyDowntime> dataChartWeeklyDowntime = [];
  List<Chart_model_DailyDowntime> dataChartDailyDowntime = [];
  List<Chart_model_Top10Downtime_DTMonitoring>
      dataChartTop10Downtime_DTMonitoring = [];
  List<Chart_model_Comperative_Downtime> dataChartComperativeDowntime = [];
  OeeJourneyModel? dataChartOEE_Journey;
  Chart_model_PDCA_Improvment? dataChartPDCA_Improvment;
  BacklogMonthModel? dataChartBacklockMonth;
  BacklogWeekModel? dataChartBacklogWeek;
  WorkPreparationModel? dataChartWorkPreparation;
  PlanningReviewModel? dataChartPlanningReview;
  BasedTaskTimeModel? dataChartBasedTaskTime;
  FinishedOntimeModel? dataChartFinishedOntime;
  WorkOrderModel? dataChartWorkOrder;
  MaintenenceCostModel? dataChartMaintenenceCost;
  ActualCostCentrePerMonthModel? dataChartActualCost;
  YtdRealizationKUsdModel? dataChartYtdRealization;
  CostDriversVcBudgetModel? dataChartCostDrivers;
  MROrderCostDistributionModel? dataChartMROrder;
  MRCostPerZonePicModel? dataChartMRCost;
  ComparisonPmOrderVsCmOrderModel? dataChartComparasionOrder;
  PmOrderRatioModel? dataChartOrderRatio;
  String _username = '';
  bool _waitLoad = false;
  bool _showInfo = false;
  bool _showComment = false;
  bool _showChart = false;
  bool _showWarning = false;
  bool _showChartOEEMonitoring = false;
  bool _showChartPrimaryStopped = false;
  bool _showChartBreakdownStopped = false;
  bool _showChartSupplyFailure = false;
  bool _showChartTechnicalFailureArea = false;
  bool _showChartWeeklyDowntime = false;
  bool _showChartDailyDowntime = false;
  bool _showChartTop10Downtime = false;
  bool _showChartTop10DTMonitoring = false;
  bool _showChartComparativeDowntime = false;
  bool _showChartPDCAImprovment = false;
  bool _showChartBacklogMonth = false;
  bool _showChartBacklogWeek = false;
  bool _showChartWorkPreparation = false;
  bool _showChartPlanningReview = false;
  bool _showChartBasedTaskTime = false;
  bool _showChartFinishedOntime = false;
  bool _showChartWorkOrder = false;
  bool _showChartMaintenenceCost = false;
  bool _showChartYtdRealization = false;
  bool _showChartActualCost = false;
  bool _showChartCostDrivers = false;
  bool _showChartMROrder = false;
  bool _showChartMRCost = false;
  bool _showChartComparasionOrder = false;
  bool _showChartOrderRatio = false;
  bool _isShowList1 = true;
  bool _isShowList2 = false;
  bool _isShowList3 = false;
  bool _isShowFilterYear = false;
  bool _isShowFilterTower = false;
  bool _isShowFilterYearTower = false;
  bool _isShowFilterYearCcname = false;
  bool _isShowFilterYearTitle = false;
  bool _isShowFilterYearPicStatus = false;
  bool _isShowFilterYearPic = false;
  bool _isShowFilterYearPicCcname = false;
  bool _isShowFilterYearTowerMonth = false;
  int indexProductListSubChildrens = 0;
  bool _isLoading = true;
  bool _requiredFilter = false;
  int selected = 0;
  int _btn = 0;
  int? _valueSwitch;
  String _buttonTitle = 'Home';
  String _title = '';
  static Color _colorBtnFalse = Color(0xffD1D5DB);
  late final AnimationController _imgAnimation =
      AnimationController(vsync: this, duration: Duration(seconds: 2))
        ..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _imgAnimation,
    curve: Curves.easeIn,
  );

  Future<String> getTower() async {
    final sp = await SharedPreferences.getInstance();
    String url = "https://be-kievit.smkrus.com/api/list/towers";
    Map<String, String> headers = {
      'Authorization': 'Bearer ' + sp.getString('token').toString(),
      'Content-Type': 'application/json'
    };
    var res = await http.get(Uri.parse(url), headers: headers);
    var resBody = json.decode(res.body);
    setState(() {
      towerList = resBody['data'];
    });
    print(resBody);
    return "Success";
  }

  Future<String> getMonth() async {
    final sp = await SharedPreferences.getInstance();
    String url = "https://be-kievit.smkrus.com/api/list/months";
    Map<String, String> headers = {
      'Authorization': 'Bearer ' + sp.getString('token').toString(),
      'Content-Type': 'application/json'
    };
    var res = await http.get(Uri.parse(url), headers: headers);
    var resBody = json.decode(res.body);
    setState(() {
      monthList = resBody['data'];
    });
    print(resBody);
    return "Success";
  }

  getYear() async {
    final sp = await SharedPreferences.getInstance();
    String url = "https://be-kievit.smkrus.com/api/list/years";
    Map<String, String> headers = {
      'Authorization': 'Bearer ' + sp.getString('token').toString(),
      'Content-Type': 'application/json'
    };
    final res = await http.get(Uri.parse(url), headers: headers);
    _yearModel = YearModel.fromJson(json.decode(res.body.toString()));
    setState(() {
      yearList = _yearModel!.data;
    });
    print(yearList);
    return "Success";
  }

  getTitle() async {
    setState(() {
      _isLoading = true;
    });
    final sp = await SharedPreferences.getInstance();
    String url = "https://be-kievit.smkrus.com/api/list/titles";
    Map<String, String> headers = {
      'Authorization': 'Bearer ' + sp.getString('token').toString(),
      'Content-Type': 'application/json'
    };
    final res = await http.get(Uri.parse(url), headers: headers);
    _titleModel = TitleModel.fromJson(json.decode(res.body.toString()));
    setState(() {
      titleList = _titleModel!.data;
      dataTitle = titleList!
          .where((element) =>
              element.vcjudul.contains(dropdownYear!.vcname.toString()))
          .toList();
    });
    print("Data Title : " + dataTitle.toString());
    return "Success";
  }

  getPicZone() async {
    final sp = await SharedPreferences.getInstance();
    String url = "https://be-kievit.smkrus.com/api/list/zones";
    Map<String, String> headers = {
      'Authorization': 'Bearer ' + sp.getString('token').toString(),
      'Content-Type': 'application/json'
    };
    final res = await http.get(Uri.parse(url), headers: headers);
    _picZoneModel = PicZoneModel.fromJson(json.decode(res.body.toString()));
    setState(() {
      piczoneList = _picZoneModel!.data;
    });
    print(piczoneList);
    return "Success";
  }

  getCcname() async {
    final sp = await SharedPreferences.getInstance();
    String url = "https://be-kievit.smkrus.com/api/list/ccnames";
    Map<String, String> headers = {
      'Authorization': 'Bearer ' + sp.getString('token').toString(),
      'Content-Type': 'application/json'
    };
    final res = await http.get(Uri.parse(url), headers: headers);
    print(res.statusCode);
    _ccNameModel = CcnameModel.fromJson(json.decode(res.body.toString()));
    setState(() {
      ccNameList = _ccNameModel!.data;
    });
    print(ccNameList);
    return "Success";
  }

  @override
  void initState() {
    // TODO: implement initState
    _getApiHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return outapp(context);
        },
        child: Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildcontent(context),
              ],
            ),
          )),
        ));
  }

  Container _buildButton(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).primaryColor, width: 3),
      ),
      child: _buildTitleAndIcon(index),
    );
  }

  SizedBox _buildTitleAndIcon(int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.14,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButtonIcon(
              menuContent[index]['vcname'], ColorValues().primaryRed),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: Text(
              menuContent[index]['vcname'],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: ColorValues().primaryRed),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildButtonList2(int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).primaryColor, width: 3)),
      child: _buildTitleAndIconList2(index),
    );
  }

  SizedBox _buildTitleAndIconList2(int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.14,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButtonIcon(
              menuContentChildrens[index]['vcname'], ColorValues().primaryRed),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: Text(
              menuContentChildrens[index]['vcname'],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: ColorValues().primaryRed),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildButtonList3(int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Theme.of(context).primaryColor, width: 3)),
      child: _buildTitleAndIconList3(index),
    );
  }

  SizedBox _buildTitleAndIconList3(int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.14,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButtonIcon(menuContentSubChildrens[index]['vcname'],
              ColorValues().primaryRed),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: Text(
              menuContentSubChildrens[index]['vcname'],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: ColorValues().primaryRed),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildButtonCenter(int index) {
    return Container(
      decoration: BoxDecoration(
          color: ColorValues().primaryRed,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).primaryColor, width: 5)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.14,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButtonIcon(menuContent[index]['vcname'], Colors.white),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text(
                menuContent[index]['vcname'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildButtonCenterList2(int index) {
    return Container(
      decoration: BoxDecoration(
          color: ColorValues().primaryRed,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).primaryColor, width: 5)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.14,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButtonIcon(
                menuContentChildrens[index]['vcname'], Colors.white),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text(
                menuContentChildrens[index]['vcname'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildButtonCenterList3(int index) {
    return Container(
      decoration: BoxDecoration(
          color: ColorValues().primaryRed,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).primaryColor, width: 5)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.14,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButtonIcon(
                menuContentSubChildrens[index]['vcname'], Colors.white),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text(
                menuContentSubChildrens[index]['vcname'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildcontent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, top: 14, right: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/logo_kievit.png',
                width: 87,
                height: 47,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/dashboard_icon.svg',
                      width: 17,
                      height: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _getApiHome();
                          _btn = 1;
                        });
                      },
                      child: Text(
                        'Home',
                        style: TextStyle(
                          color: (_btn == 1)
                              ? ColorValues().primaryRed
                              : _colorBtnFalse,
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/favorite_display_icon.svg',
                      width: 17,
                      height: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _btn = 2;
                        });
                      },
                      child: Text(
                        '''Favorite
Display''',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: (_btn == 2)
                                ? ColorValues().primaryRed
                                : _colorBtnFalse,
                            fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/settings.svg',
                      width: 17,
                      height: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _btn = 3;
                        });
                      },
                      child: Text(
                        'Setting',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: (_btn == 3)
                                ? ColorValues().primaryRed
                                : _colorBtnFalse,
                            fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/notifications_icon.svg',
                      width: 17,
                      height: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _btn = 4;
                        });
                      },
                      child: Text(
                        'Notification',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: (_btn == 4)
                                ? ColorValues().primaryRed
                                : _colorBtnFalse,
                            fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _requiredFilter
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: Size(double.infinity, 30),
                                ),
                                onPressed: () {
                                  if (_isShowList3) {
                                    setState(() {
                                      dropdownYear = null;
                                      dropdownTower = null;
                                      dropdownMonth = null;
                                      dropdownTitle = null;
                                      _showWarning = false;
                                      _requiredFilter = false;
                                      _showComment = false;
                                      _showInfo = false;
                                      _showChart = false;
                                      _isShowList1 = false;
                                      _isShowList2 = true;
                                      _buttonTitle = '<- Back';
                                      _isShowList3 = false;
                                      _isShowFilterYearCcname = false;
                                      _isShowFilterYearPicCcname = false;
                                      _isShowFilterYearTowerMonth = false;
                                      _isShowFilterYearPicStatus = false;
                                      _isShowFilterYearPic = false;
                                      _isShowFilterYearTitle = false;
                                      _isShowFilterYearTower = false;
                                      _isShowFilterTower = false;
                                      _isShowFilterYear = false;
                                      _isLoading = false;
                                    });
                                  } else if (_isShowList2) {
                                    setState(() {
                                      dropdownYear = null;
                                      dropdownTower = null;
                                      dropdownMonth = null;
                                      dropdownTitle = null;
                                      _showWarning = false;
                                      _requiredFilter = false;
                                      _buttonTitle = 'Home';
                                      _showComment = false;
                                      _showInfo = false;
                                      _showChart = false;
                                      _isShowList1 = true;
                                      _isShowList2 = false;
                                      _isShowList3 = false;
                                      _isShowFilterYearCcname = false;
                                      _isShowFilterYearPicCcname = false;
                                      _isShowFilterYearTowerMonth = false;
                                      _isShowFilterYearPicStatus = false;
                                      _isShowFilterYearPic = false;
                                      _isShowFilterYearTitle = false;
                                      _isShowFilterYearTower = false;
                                      _isShowFilterTower = false;
                                      _isShowFilterYear = false;
                                      _isLoading = false;
                                    });
                                  } else if (_isShowList1) {
                                    setState(() {
                                      dropdownYear = null;
                                      dropdownTower = null;
                                      dropdownMonth = null;
                                      dropdownTitle = null;
                                      _showWarning = false;
                                      _requiredFilter = false;
                                      _showComment = false;
                                      _showInfo = false;
                                      _showChart = false;
                                      _isShowList1 = true;
                                      _isShowList2 = false;
                                      _isShowList3 = false;
                                      _isShowFilterYearCcname = false;
                                      _isShowFilterYearPicCcname = false;
                                      _isShowFilterYearTowerMonth = false;
                                      _isShowFilterYearPicStatus = false;
                                      _isShowFilterYearPic = false;
                                      _isShowFilterYearTitle = false;
                                      _isShowFilterYearTower = false;
                                      _isShowFilterTower = false;
                                      _isShowFilterYear = false;
                                      _isLoading = false;
                                    });
                                  } else {}
                                },
                                child: Text(
                                  _buttonTitle,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              _title,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: ColorValues().primaryRed,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "Please Fill the Filter for Your Requirement Chart",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Spacer(),
                          FadeTransition(
                            opacity: _animation,
                            child: Image.asset(
                              'assets/logo_kievit.png',
                              width: 200,
                              height: 110,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    )
                  : _isLoading
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      minimumSize: Size(double.infinity, 30),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      _buttonTitle,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  _title,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: ColorValues().primaryRed,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Spacer(),
                              FadeTransition(
                                opacity: _animation,
                                child: Image.asset(
                                  'assets/logo_kievit.png',
                                  width: 200,
                                  height: 110,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        )
                      : _showWarning
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          minimumSize:
                                              Size(double.infinity, 30),
                                        ),
                                        onPressed: () {
                                          if (_isShowList3) {
                                            setState(() {
                                              dropdownYear = null;
                                              dropdownTower = null;
                                              dropdownMonth = null;
                                              dropdownTitle = null;
                                              _showWarning = false;
                                              _requiredFilter = false;
                                              _showComment = false;
                                              _showInfo = false;
                                              _showChart = false;
                                              _isShowList1 = false;
                                              _isShowList2 = true;
                                              _buttonTitle = '<- Back';
                                              _isShowList3 = false;
                                              _isShowFilterYearCcname = false;
                                              _isShowFilterYearPicCcname =
                                                  false;
                                              _isShowFilterYearTowerMonth =
                                                  false;
                                              _isShowFilterYearTitle = false;
                                              _isShowFilterYearPicStatus =
                                                  false;
                                              _isShowFilterYearPic = false;
                                              _isShowFilterYearTower = false;
                                              _isShowFilterTower = false;
                                              _isShowFilterYear = false;
                                              _isLoading = false;
                                            });
                                          } else if (_isShowList2) {
                                            setState(() {
                                              dropdownYear = null;
                                              dropdownTower = null;
                                              dropdownMonth = null;
                                              dropdownTitle = null;
                                              _showWarning = false;
                                              _requiredFilter = false;
                                              _buttonTitle = 'Home';
                                              _showComment = false;
                                              _showInfo = false;
                                              _showChart = false;
                                              _isShowList1 = true;
                                              _isShowList2 = false;
                                              _isShowList3 = false;
                                              _isShowFilterYearCcname = false;
                                              _isShowFilterYearPicCcname =
                                                  false;
                                              _isShowFilterYearTowerMonth =
                                                  false;
                                              _isShowFilterYearTitle = false;
                                              _isShowFilterYearPicStatus =
                                                  false;
                                              _isShowFilterYearPic = false;
                                              _isShowFilterYearTower = false;
                                              _isShowFilterTower = false;
                                              _isShowFilterYear = false;
                                              _isLoading = false;
                                            });
                                          } else if (_isShowList1) {
                                            setState(() {
                                              dropdownYear = null;
                                              dropdownTower = null;
                                              dropdownMonth = null;
                                              dropdownTitle = null;
                                              _showWarning = false;
                                              _requiredFilter = false;
                                              _showComment = false;
                                              _showInfo = false;
                                              _showChart = false;
                                              _isShowList1 = true;
                                              _isShowList2 = false;
                                              _isShowList3 = false;
                                              _isShowFilterYearCcname = false;
                                              _isShowFilterYearPicCcname =
                                                  false;
                                              _isShowFilterYearTowerMonth =
                                                  false;
                                              _isShowFilterYearTitle = false;
                                              _isShowFilterYearPicStatus =
                                                  false;
                                              _isShowFilterYearPic = false;
                                              _isShowFilterYearTower = false;
                                              _isShowFilterTower = false;
                                              _isShowFilterYear = false;
                                              _isLoading = false;
                                            });
                                          } else {}
                                        },
                                        child: Text(
                                          _buttonTitle,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      _title,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: ColorValues().primaryRed,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Spacer(),
                                  FadeTransition(
                                    opacity: _animation,
                                    child: Text(
                                      "Data not Found for Year " +
                                          dropdownYear!.vcname.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Spacer()
                                ],
                              ),
                            )
                          : _showChart
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                            minimumSize:
                                                Size(double.infinity, 30),
                                          ),
                                          onPressed: () {
                                            if (_isShowList3) {
                                              setState(() {
                                                dropdownYear = null;
                                                dropdownTower = null;
                                                dropdownMonth = null;
                                                dropdownTitle = null;
                                                _showWarning = false;
                                                _requiredFilter = false;
                                                _showComment = false;
                                                _showInfo = false;
                                                _showChart = false;
                                                _isShowList1 = false;
                                                _isShowList2 = true;
                                                _buttonTitle = '<- Back';
                                                _isShowList3 = false;
                                                _isShowFilterYearCcname = false;
                                                _isShowFilterYearPicCcname =
                                                    false;
                                                _isShowFilterYearTowerMonth =
                                                    false;
                                                _isShowFilterYearTitle = false;
                                                _isShowFilterYearPicStatus =
                                                    false;
                                                _isShowFilterYearPic = false;
                                                _isShowFilterYearTower = false;
                                                _isShowFilterTower = false;
                                                _isShowFilterYear = false;
                                                _isLoading = false;
                                              });
                                            } else if (_isShowList2) {
                                              setState(() {
                                                dropdownYear = null;
                                                dropdownTower = null;
                                                dropdownMonth = null;
                                                dropdownTitle = null;
                                                _showWarning = false;
                                                _requiredFilter = false;
                                                _buttonTitle = 'Home';
                                                _showComment = false;
                                                _showInfo = false;
                                                _showChart = false;
                                                _isShowList1 = true;
                                                _isShowList2 = false;
                                                _isShowList3 = false;
                                                _isShowFilterYearCcname = false;
                                                _isShowFilterYearPicCcname =
                                                    false;
                                                _isShowFilterYearTowerMonth =
                                                    false;
                                                _isShowFilterYearTitle = false;
                                                _isShowFilterYearPicStatus =
                                                    false;
                                                _isShowFilterYearPic = false;
                                                _isShowFilterYearTower = false;
                                                _isShowFilterTower = false;
                                                _isShowFilterYear = false;
                                                _isLoading = false;
                                              });
                                            } else if (_isShowList1) {
                                              setState(() {
                                                dropdownYear = null;
                                                dropdownTower = null;
                                                dropdownMonth = null;
                                                dropdownTitle = null;
                                                _showWarning = false;
                                                _requiredFilter = false;
                                                _showComment = false;
                                                _showInfo = false;
                                                _showChart = false;
                                                _isShowList1 = true;
                                                _isShowList2 = false;
                                                _isShowList3 = false;
                                                _isShowFilterYearCcname = false;
                                                _isShowFilterYearPicCcname =
                                                    false;
                                                _isShowFilterYearTowerMonth =
                                                    false;
                                                _isShowFilterYearTitle = false;
                                                _isShowFilterYearPicStatus =
                                                    false;
                                                _isShowFilterYearPic = false;
                                                _isShowFilterYearTower = false;
                                                _isShowFilterTower = false;
                                                _isShowFilterYear = false;
                                                _isLoading = false;
                                              });
                                            } else {}
                                          },
                                          child: Text(
                                            _buttonTitle,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15),
                                          )),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: Text(
                                        _title,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: ColorValues().primaryRed,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    _showChartOrderRatio
                                        ? ChartComponent_PMOrderRatio(
                                            chartRatio:
                                                dataChartOrderRatio!.data)
                                        : _showChartComparasionOrder
                                            ? ChartComponent_ComparasionOrder(
                                                dataChartComparasionOrder:
                                                    dataChartComparasionOrder!
                                                        .data)
                                            : _showChartMRCost
                                                ? ChartComponent_MR_Cost(
                                                    dataChartMrCost:
                                                        dataChartMRCost!.data)
                                                : _showChartMROrder
                                                    ? ChartComponent_MR_Order(
                                                        dataChartMrOrder:
                                                            dataChartMROrder!
                                                                .data)
                                                    : _showChartCostDrivers
                                                        ? ChartComponent_CostDrivers(
                                                            dataChartCostDriver:
                                                                dataChartCostDrivers!
                                                                    .data)
                                                        : _showChartYtdRealization
                                                            ? ChartComponent_YtdRealization(
                                                                chartPieYtd:
                                                                    dataChartYtdRealization!
                                                                        .data[0]
                                                                        .chart,
                                                                chartSpeedometerYtd:
                                                                    dataChartYtdRealization!
                                                                        .data[1]
                                                                        .chart,
                                                              )
                                                            : _showChartActualCost
                                                                ? ChartComponent_ActualCost(
                                                                    dataChartActualCost:
                                                                        dataChartActualCost!
                                                                            .data
                                                                            .chart,
                                                                  )
                                                                : _showChartMaintenenceCost
                                                                    ? ChartComponent_MaintenenceCost(
                                                                        dataChartMaintenenceCost: dataChartMaintenenceCost!
                                                                            .data
                                                                            .chart)
                                                                    : _showChartWorkOrder
                                                                        ? ChartComponent_WorkOrder(
                                                                            dataChartWONotif:
                                                                                dataChartWorkOrder!.data.notificationRegistered,
                                                                            dataChartWOQuality: dataChartWorkOrder!.data.forSafetyLegalQuality)
                                                                        : _showChartFinishedOntime
                                                                            ? ChartComponent_FinishedOntime(
                                                                                dataChartFinishPM: dataChartFinishedOntime!.data[0].chart,
                                                                                dataChartOntime: dataChartFinishedOntime!.data[1].chart,
                                                                                dataChartFinishedOnTime: dataChartFinishedOntime!.data,
                                                                              )
                                                                            : _showChartBasedTaskTime
                                                                                ? ChartComponent_BasedTaskTime(
                                                                                    dataChartBasedTask: dataChartBasedTaskTime!.data[0].chart.detail,
                                                                                    dataChartBased: dataChartBasedTaskTime!.data,
                                                                                    dataChartBasedTime: dataChartBasedTaskTime!.data[1].chart.detail,
                                                                                  )
                                                                                : _showChartPlanningReview
                                                                                    ? ChartComponent_PlanningReview(dataChartPlanningReview: dataChartPlanningReview!.data.chart)
                                                                                    : _showChartWorkPreparation
                                                                                        ? ChartComponent_WorkPreparation(dataChartWorkPreparation: dataChartWorkPreparation!.data[0].chart, dataChartTitle: dataChartWorkPreparation!.data, dataChartPMOrder: dataChartWorkPreparation!.data[1].chart)
                                                                                        : _showChartBacklogWeek
                                                                                            ? ChartComponent_BacklogWeek(
                                                                                                dataChartBacklogWeek: dataChartBacklogWeek!.data[0].detail,
                                                                                                dataBacklogWeek: dataChartBacklogWeek!.data,
                                                                                              )
                                                                                            : _showChartBacklogMonth
                                                                                                ? ChartComponent_BacklogMonth(dataChart_backlogMonthData: dataChartBacklockMonth)
                                                                                                : _showChartPDCAImprovment
                                                                                                    ? ChartComponent_PDCAImprovment(dataChartPDCA_Improvment: dataChartPDCA_Improvment)
                                                                                                    : _showChartComparativeDowntime
                                                                                                        ? ChartComponent_ComperativeDowntime(dataChartComperativeDowntime: dataChartComperativeDowntime)
                                                                                                        : _showChartTop10DTMonitoring
                                                                                                            ? ChartComponent_Top10DTMonitoring(dataChartTop10Downtime_DTMonitoring: dataChartTop10Downtime_DTMonitoring)
                                                                                                            : _showChartTop10Downtime
                                                                                                                ? ChartComponent_Top10Downtime(dataChartTop10Downtime_DTMonitoring: dataChartTop10Downtime_DTMonitoring)
                                                                                                                : _showChartDailyDowntime
                                                                                                                    ? ChartComponent_DailyDowntime(dataChartDailyDowntime: dataChartDailyDowntime)
                                                                                                                    : _showChartWeeklyDowntime
                                                                                                                        ? ChartComponent_WeeklyDowntime(dataChartWeeklyDowntime: dataChartWeeklyDowntime)
                                                                                                                        : _showChartTechnicalFailureArea
                                                                                                                            ? ChartComponent_TechnicalFailureArea(dataChartSupplyFailureTechnicalFailureArea: dataChartSupplyFailureTechnicalFailureArea)
                                                                                                                            : _showChartSupplyFailure
                                                                                                                                ? ChartComponent_SupplyFailure(dataChartSupplyFailureTechnicalFailureArea: dataChartSupplyFailureTechnicalFailureArea)
                                                                                                                                : _showChartPrimaryStopped
                                                                                                                                    ? ChartComponent_PrimaryStopped(dataChartPrimaryBreakdownStopped: dataChartPrimaryBreakdownStopped)
                                                                                                                                    : _showChartBreakdownStopped
                                                                                                                                        ? ChartComponent_BreakdownStopped(dataChartPrimaryBreakdownStopped: dataChartPrimaryBreakdownStopped)
                                                                                                                                        : _showChartOEEMonitoring
                                                                                                                                            ? ChartComponent_OEEMonitoring(dataChartOEEMonitoring: dataChartOEEMonitoring)
                                                                                                                                            : ChartComponent_OEEJourney(dataChartOEEJourney: dataChartOEE_Journey!.data),
                                  ],
                                )
                              : SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              minimumSize:
                                                  Size(double.infinity, 30),
                                            ),
                                            onPressed: () {
                                              if (_isShowList3) {
                                                setState(() {
                                                  dropdownYear = null;
                                                  dropdownTower = null;
                                                  dropdownMonth = null;
                                                  dropdownTitle = null;
                                                  _showWarning = false;
                                                  _requiredFilter = false;
                                                  _showComment = false;
                                                  _showInfo = false;
                                                  _showChart = false;
                                                  _isShowList1 = false;
                                                  _isShowList2 = true;
                                                  _buttonTitle = '<- Back';
                                                  _isShowList3 = false;
                                                  _isShowFilterYearCcname =
                                                      false;
                                                  _isShowFilterYearPicCcname =
                                                      false;
                                                  _isShowFilterYearTowerMonth =
                                                      false;
                                                  _isShowFilterYearTitle =
                                                      false;
                                                  _isShowFilterYearTower =
                                                      false;
                                                  _isShowFilterYearPicStatus =
                                                      false;
                                                  _isShowFilterYearPic = false;
                                                  _isShowFilterTower = false;
                                                  _isShowFilterYear = false;
                                                  _isLoading = false;
                                                });
                                              } else if (_isShowList2) {
                                                setState(() {
                                                  dropdownYear = null;
                                                  dropdownTower = null;
                                                  dropdownMonth = null;
                                                  dropdownTitle = null;
                                                  _showWarning = false;
                                                  _requiredFilter = false;
                                                  _buttonTitle = 'Home';
                                                  _showComment = false;
                                                  _showInfo = false;
                                                  _showChart = false;
                                                  _isShowList1 = true;
                                                  _isShowList2 = false;
                                                  _isShowList3 = false;
                                                  _isShowFilterYearCcname =
                                                      false;
                                                  _isShowFilterYearPicCcname =
                                                      false;
                                                  _isShowFilterYearTowerMonth =
                                                      false;
                                                  _isShowFilterYearPicStatus =
                                                      false;
                                                  _isShowFilterYearTitle =
                                                      false;
                                                  _isShowFilterYearTower =
                                                      false;
                                                  _isShowFilterYearPic = false;
                                                  _isShowFilterTower = false;
                                                  _isShowFilterYear = false;
                                                  _isLoading = false;
                                                });
                                              } else if (_isShowList1) {
                                                setState(() {
                                                  dropdownYear = null;
                                                  dropdownTower = null;
                                                  dropdownMonth = null;
                                                  dropdownTitle = null;
                                                  _showWarning = false;
                                                  _requiredFilter = false;
                                                  _showComment = false;
                                                  _showInfo = false;
                                                  _showChart = false;
                                                  _isShowList1 = true;
                                                  _isShowList2 = false;
                                                  _isShowList3 = false;
                                                  _isShowFilterYearCcname =
                                                      false;
                                                  _isShowFilterYearPicCcname =
                                                      false;
                                                  _isShowFilterYearTowerMonth =
                                                      false;
                                                  _isShowFilterYearTitle =
                                                      false;
                                                  _isShowFilterYearPicStatus =
                                                      false;
                                                  _isShowFilterYearTower =
                                                      false;
                                                  _isShowFilterYearPic = false;
                                                  _isShowFilterTower = false;
                                                  _isShowFilterYear = false;
                                                  _isLoading = false;
                                                });
                                              } else {}
                                            },
                                            child: Text(
                                              _buttonTitle,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Spacer(),
                                      FadeTransition(
                                        opacity: _animation,
                                        child: Image.asset(
                                          'assets/logo_kievit.png',
                                          width: 200,
                                          height: 110,
                                        ),
                                      ),
                                      Spacer()
                                    ],
                                  ),
                                ),
              _waitLoad
                  ? wait_load()
                  : _isShowList1
                      ? list_satu()
                      : _isShowList2
                          ? list_dua()
                          : _isShowList3
                              ? list_tiga()
                              : Container(),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, right: 10, left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Hi, " + _username,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext c) => Profile()));
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              scale: 2,
                              image: AssetImage("assets/icons/user_icon.png")),
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(17)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            _isShowFilterYearPicCcname
                ? filter_year_piczone_ccname()
                : _isShowFilterYearCcname
                    ? filter_year_ccname()
                    : _isShowFilterYearTowerMonth
                        ? filter_year_tower_month()
                        : _isShowFilterYearTitle
                            ? filter_year_title()
                            : _isShowFilterYearPicStatus
                                ? filter_year_piczone_status()
                                : _isShowFilterYearPic
                                    ? filter_year_piczone()
                                    : _isShowFilterYearTower
                                        ? filter_year_tower()
                                        : _isShowFilterTower
                                            ? filter_tower()
                                            : _isShowFilterYear
                                                ? filter_year()
                                                : Container(),
            SizedBox(
              height: 20,
            ),
            _showInfo
                ? Container(
                    height: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Info :",
                            style: TextStyle(color: Colors.black, fontSize: 9)),
                        SizedBox(
                          height: 5,
                        ),
                        Row(children: [
                          Image.asset('assets/icons/controlable_icon.png',
                              width: 14, height: 14),
                          Text(" = Controlable",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 9)),
                        ]),
                        SizedBox(height: 10),
                        Row(children: [
                          Image.asset('assets/icons/monitoring_icon.png',
                              width: 14, height: 14),
                          Text(" = Monitoring",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 9)),
                        ]),
                      ],
                    ),
                  )
                : Container(),
            _showComment
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext c) => commentPage(
                                    id: menuContentSubChildrens[
                                            indexProductListSubChildrens]['id']
                                        .toString(),
                                    title: menuContentSubChildrens[
                                                indexProductListSubChildrens]
                                            ['vcname']
                                        .toString(),
                                  )));
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/icons/comment_icon.png")),
                          shape: BoxShape.circle,
                          color: ColorValues().primaryRed),
                    ),
                  )
                : Container(),
          ],
        )
      ],
    );
  }

  Widget filter_year_tower() {
    return SizedBox(
        height: 125,
        child: SingleChildScrollView(
          child: Column(
            children: [filter_tower(), SizedBox(height: 12), filter_year()],
          ),
        ));
  }

  Widget filter_year_title() {
    return SizedBox(
        height: 125,
        child: SingleChildScrollView(
          child: Column(
            children: [
              filter_year(),
              SizedBox(height: 12),
              dataTitle.isEmpty ? Container() : filter_title()
            ],
          ),
        ));
  }

  Widget filter_year_ccname() {
    return SizedBox(
        height: 125,
        child: SingleChildScrollView(
          child: Column(
            children: [filter_year(), SizedBox(height: 12), filter_ccname()],
          ),
        ));
  }

  Widget filter_year_piczone_status() {
    return SizedBox(
        height: 200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              filter_year(),
              SizedBox(height: 12),
              filter_piczone(),
              SizedBox(height: 12),
              filter_status_backlog()
            ],
          ),
        ));
  }

  Widget filter_year_piczone() {
    return SizedBox(
        height: 200,
        child: SingleChildScrollView(
          child: Column(
            children: [filter_year(), SizedBox(height: 12), filter_piczone()],
          ),
        ));
  }

  Widget filter_year_piczone_ccname() {
    return SizedBox(
        height: 200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              filter_year(),
              SizedBox(height: 12),
              filter_piczone(),
              SizedBox(height: 12),
              filter_ccname()
            ],
          ),
        ));
  }

  Widget filter_year_tower_month() {
    return SizedBox(
        height: 200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              filter_tower(),
              SizedBox(height: 12),
              filter_year(),
              SizedBox(height: 12),
              filter_month()
            ],
          ),
        ));
  }

  Widget filter_year() {
    return SizedBox(
        child: Column(
      children: <Widget>[
        Text(
          'Year :',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
        ),
        SizedBox(height: 5),
        Container(
            height: 30,
            width: 75,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<YearData>(
              isExpanded: true,
              value: dropdownYear,
              iconSize: 20,
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (newValue) {
                setState(() {
                  dropdownYear = newValue!;
                  getTitle();
                  _isLoading = true;
                  if (_showChartOEEMonitoring) {
                    if (dropdownYear != null) {
                      getChartFromApi_OEEMonitoring(
                          "year=" + dropdownYear!.vcname.toString());
                    } else {}
                  } else if (_showChartTop10Downtime ||
                      _showChartTop10DTMonitoring) {
                    if (dropdownYear != null) {
                      getChartFromApi_Top10Downtime_DTMonitoring(
                          "year=" + dropdownYear!.vcname.toString());
                    } else {}
                  } else if (_showChartPDCAImprovment) {
                    if (dropdownYear != null && dropdownTitle != null) {
                      getChartFromApi_PDCA_Improvment("year=" +
                          dropdownYear!.vcname.toString() +
                          "&title=" +
                          dropdownTitle!.vcjudul.toString());
                    } else {}
                  } else if (_showChartWeeklyDowntime) {
                    if (dropdownTower != null && dropdownYear != null) {
                      getChartFromApi_WeeklyDowntime("tower=" +
                          dropdownTower!.toString() +
                          "&year=" +
                          dropdownYear!.vcname.toString());
                    } else {}
                  } else if (_showChartComparativeDowntime) {
                    if (dropdownTower != null && dropdownYear != null) {
                      getChartFromApi_Comperative_Downtime("tower=" +
                          dropdownTower!.toString() +
                          "&year=" +
                          dropdownYear!.vcname.toString());
                    } else {}
                  } else if (_showChartDailyDowntime) {
                    if (dropdownTower != null &&
                        dropdownYear != null &&
                        dropdownMonth != null) {
                      getChartFromApi_DailyDowntime("tower=" +
                          dropdownTower.toString() +
                          "&year=" +
                          dropdownYear!.vcname.toString() +
                          "&month=" +
                          dropdownMonth.toString());
                    } else {}
                  } else if (_showChartBacklogMonth) {
                    if (dropdownYear != null &&
                        dropdownPicZone != null &&
                        _valueSwitch != null) {
                      getChartFromApi_BacklogMonth("year=" +
                          dropdownYear!.vcname.toString() +
                          "&pic=" +
                          dropdownPicZone!.id.toString() +
                          "&backlog=" +
                          _valueSwitch.toString());
                    } else {}
                  } else if (_showChartBacklogWeek) {
                    if (dropdownYear != null && dropdownPicZone != null) {
                      getChartFromApi_BacklogWeek("year=" +
                          dropdownYear!.vcname.toString() +
                          "&pic=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartWorkPreparation) {
                    if (dropdownYear != null && dropdownPicZone != null) {
                      getChartFromApi_WorkPreparation("year=" +
                          dropdownYear!.vcname.toString() +
                          "&pic=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartPlanningReview) {
                    if (dropdownYear != null && dropdownPicZone != null) {
                      getChartFromApi_PlanningReview("year=" +
                          dropdownYear!.vcname.toString() +
                          "&pic=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartBasedTaskTime) {
                    if (dropdownYear != null && dropdownPicZone != null) {
                      getChartFromApi_BasedTaskTime("year=" +
                          dropdownYear!.vcname.toString() +
                          "&pic=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartFinishedOntime) {
                    if (dropdownYear != null && dropdownPicZone != null) {
                      getChartFromApi_FinishedOntime("year=" +
                          dropdownYear!.vcname.toString() +
                          "&pic=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartWorkOrder) {
                    if (dropdownYear != null && dropdownPicZone != null) {
                      getChartFromApi_WorkOrder("year=" +
                          dropdownYear!.vcname.toString() +
                          "&pic=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartMaintenenceCost) {
                    if (dropdownYear != null && dropdownCcName != null) {
                      getChartFromApi_MaintenenceCost("year=" +
                          dropdownYear!.vcname.toString() +
                          "&ccname=" +
                          dropdownCcName!.id.toString());
                    } else {}
                  } else if (_showChartActualCost) {
                    if (dropdownYear != null) {
                      getChartFromApi_ActualCost(
                          "year=" + dropdownYear!.vcname.toString());
                    } else {}
                  } else if (_showChartCostDrivers) {
                    if (dropdownYear != null) {
                      getChartFromApi_CostDrivers(
                          "year=" + dropdownYear!.vcname.toString());
                    } else {}
                  } else if (_showChartYtdRealization) {
                    if (dropdownYear != null && dropdownCcName != null) {
                      getChartFromApi_YtdRealization("year=" +
                          dropdownYear!.vcname.toString() +
                          "&ccname=" +
                          dropdownCcName!.id.toString());
                    } else {}
                  } else if (_showChartMROrder) {
                    if (dropdownYear != null) {
                      getChartFromApi_MROrder(
                          "year=" + dropdownYear!.vcname.toString());
                    } else {}
                  } else if (_showChartMRCost) {
                    if (dropdownYear != null &&
                        dropdownPicZone != null &&
                        dropdownCcName != null) {
                      getChartFromApi_MRCost("year=" +
                          dropdownYear!.vcname.toString() +
                          "&ccname=" +
                          dropdownCcName!.id.toString() +
                          "&zone=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartComparasionOrder) {
                    if (dropdownYear != null &&
                        dropdownPicZone != null &&
                        dropdownCcName != null) {
                      getChartFromApi_ComparasionOrder("year=" +
                          dropdownYear!.vcname.toString() +
                          "&ccname=" +
                          dropdownCcName!.id.toString() +
                          "&zone=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartOrderRatio) {
                    if (dropdownYear != null &&
                        dropdownPicZone != null &&
                        dropdownCcName != null) {
                      getChartFromApi_PmOrderRatio("year=" +
                          dropdownYear!.vcname.toString() +
                          "&ccname=" +
                          dropdownCcName!.id.toString() +
                          "&zone=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  }
                });
              },
              isDense: true,
              underline: SizedBox.shrink(),
              items: yearList?.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item.vcname.toString(),
                        style:
                            TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                      ),
                      value: item,
                    );
                  }).toList() ??
                  [],
            )),
      ],
    ));
  }

  Widget filter_month() {
    return SizedBox(
        child: Column(
      children: <Widget>[
        Text(
          'Month :',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
        ),
        SizedBox(height: 5),
        Container(
            height: 30,
            width: 90,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownMonth,
              iconSize: 20,
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownMonth = newValue!;
                  _isLoading = true;
                  if (_showChartDailyDowntime) {
                    if (dropdownTower != null &&
                        dropdownYear != null &&
                        dropdownMonth != null) {
                      getChartFromApi_DailyDowntime("tower=" +
                          dropdownTower.toString() +
                          "&year=" +
                          dropdownYear!.vcname.toString() +
                          "&month=" +
                          dropdownMonth.toString());
                    } else {}
                  }
                });
              },
              isDense: true,
              underline: SizedBox.shrink(),
              items: monthList?.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item['vcname'],
                        style:
                            TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                      ),
                      value: item['id'].toString(),
                    );
                  }).toList() ??
                  [],
            )),
      ],
    ));
  }

  Widget filter_tower() {
    return SizedBox(
        child: Column(
      children: <Widget>[
        Text(
          'Select Tower',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
        ),
        SizedBox(height: 5),
        Container(
            height: 30,
            width: 90,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownTower,
              iconSize: 20,
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownTower = newValue!;
                  print(dropdownTower);
                  _isLoading = true;
                  if (_showChartSupplyFailure ||
                      _showChartTechnicalFailureArea) {
                    if (dropdownTower != null) {
                      getChartFromApi_SupplyFailureTechnicalFailureArea(
                          "tower=" + dropdownTower.toString());
                    } else {}
                  } else if (_showChartBreakdownStopped ||
                      _showChartPrimaryStopped) {
                    if (dropdownTower != null) {
                      getChartFromApi_PrimaryBreakdown(
                          "tower=" + dropdownTower.toString());
                    } else {}
                  } else if (_showChartWeeklyDowntime) {
                    if (dropdownTower != null && dropdownYear != null) {
                      getChartFromApi_WeeklyDowntime("tower=" +
                          dropdownTower.toString() +
                          "&year=" +
                          dropdownYear!.vcname.toString());
                    } else {}
                  } else if (_showChartComparativeDowntime) {
                    if (dropdownTower != null && dropdownYear != null) {
                      getChartFromApi_Comperative_Downtime("tower=" +
                          dropdownTower.toString() +
                          "&year=" +
                          dropdownYear!.vcname.toString());
                    } else {}
                  } else if (_showChartDailyDowntime) {
                    if (dropdownTower != null &&
                        dropdownYear != null &&
                        dropdownMonth != null) {
                      getChartFromApi_DailyDowntime("tower=" +
                          dropdownTower.toString() +
                          "&year=" +
                          dropdownYear!.vcname.toString() +
                          "&month=" +
                          dropdownMonth.toString());
                    } else {}
                  }
                });
              },
              isDense: true,
              underline: SizedBox.shrink(),
              items: towerList?.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item['vcname'],
                        style:
                            TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                      ),
                      value: item['id'].toString(),
                    );
                  }).toList() ??
                  [],
            )),
      ],
    ));
  }

  Widget filter_title() {
    return SizedBox(
        child: Column(
      children: <Widget>[
        Text(
          'Select Title',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
        ),
        SizedBox(height: 5),
        Container(
            height: 30,
            width: 90,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<TitleData>(
              isExpanded: true,
              value: dropdownTitle,
              iconSize: 20,
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (newValue) async {
                setState(() {
                  dropdownTitle = newValue!;
                  print(dropdownTitle);
                  _isLoading = true;
                  if (_showChartPDCAImprovment) {
                    if (dropdownYear != null && dropdownTitle != null) {
                      getChartFromApi_PDCA_Improvment("year=" +
                          dropdownYear!.vcname.toString() +
                          "&title=" +
                          dropdownTitle!.vcjudul.toString());
                    } else {}
                  }
                });
              },
              isDense: true,
              underline: SizedBox.shrink(),
              items: dataTitle.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item.vcjudul,
                        style:
                            TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                      ),
                      value: item,
                    );
                  }).toList() ??
                  [],
            )),
      ],
    ));
  }

  Widget filter_ccname() {
    return SizedBox(
        child: Column(
      children: <Widget>[
        Text(
          'Select Ccname',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
        ),
        SizedBox(height: 5),
        Container(
            height: 30,
            width: 90,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<CcnameData>(
              isExpanded: true,
              value: dropdownCcName,
              iconSize: 20,
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (newValue) {
                setState(() {
                  dropdownCcName = newValue!;
                  print(dropdownCcName);
                  _isLoading = true;
                  if (_showChartMaintenenceCost) {
                    if (dropdownYear != null && dropdownCcName != null) {
                      getChartFromApi_MaintenenceCost("year=" +
                          dropdownYear!.vcname.toString() +
                          "&ccname=" +
                          dropdownCcName!.id.toString());
                    } else {}
                  } else if (_showChartYtdRealization) {
                    if (dropdownYear != null && dropdownCcName != null) {
                      getChartFromApi_YtdRealization("year=" +
                          dropdownYear!.vcname.toString() +
                          "&ccname=" +
                          dropdownCcName!.id.toString());
                    } else {}
                  } else if (_showChartMRCost) {
                    if (dropdownYear != null &&
                        dropdownPicZone != null &&
                        dropdownCcName != null) {
                      getChartFromApi_MRCost("year=" +
                          dropdownYear!.vcname.toString() +
                          "&ccname=" +
                          dropdownCcName!.id.toString() +
                          "&zone=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartComparasionOrder) {
                    if (dropdownYear != null &&
                        dropdownPicZone != null &&
                        dropdownCcName != null) {
                      getChartFromApi_ComparasionOrder("year=" +
                          dropdownYear!.vcname.toString() +
                          "&ccname=" +
                          dropdownCcName!.id.toString() +
                          "&zone=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartOrderRatio) {
                    if (dropdownYear != null &&
                        dropdownPicZone != null &&
                        dropdownCcName != null) {
                      getChartFromApi_PmOrderRatio("year=" +
                          dropdownYear!.vcname.toString() +
                          "&ccname=" +
                          dropdownCcName!.id.toString() +
                          "&zone=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  }
                });
              },
              isDense: true,
              underline: SizedBox.shrink(),
              items: ccNameList?.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item.vcname,
                        style:
                            TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                      ),
                      value: item,
                    );
                  }).toList() ??
                  [],
            )),
      ],
    ));
  }

  Widget filter_piczone() {
    return SizedBox(
        child: Column(
      children: <Widget>[
        Text(
          'Select PIC',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
        ),
        SizedBox(height: 5),
        Container(
            height: 30,
            width: 90,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<PicZoneData>(
              isExpanded: true,
              value: dropdownPicZone,
              iconSize: 20,
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (newValue) {
                setState(() {
                  dropdownPicZone = newValue!;
                  print(dropdownPicZone);
                  _isLoading = true;
                  if (_showChartBacklogMonth) {
                    if (dropdownYear != null &&
                        dropdownPicZone != null &&
                        _valueSwitch != null) {
                      getChartFromApi_BacklogMonth("year=" +
                          dropdownYear!.vcname.toString() +
                          "&pic=" +
                          dropdownPicZone!.id.toString() +
                          "&backlog=" +
                          _valueSwitch.toString());
                    } else {}
                  } else if (_showChartBacklogWeek) {
                    if (dropdownYear != null && dropdownPicZone != null) {
                      getChartFromApi_BacklogWeek("year=" +
                          dropdownYear!.vcname.toString() +
                          "&pic=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartWorkPreparation) {
                    if (dropdownYear != null && dropdownPicZone != null) {
                      getChartFromApi_WorkPreparation("year=" +
                          dropdownYear!.vcname.toString() +
                          "&pic=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartPlanningReview) {
                    if (dropdownYear != null && dropdownPicZone != null) {
                      getChartFromApi_PlanningReview("year=" +
                          dropdownYear!.vcname.toString() +
                          "&pic=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartBasedTaskTime) {
                    if (dropdownYear != null && dropdownPicZone != null) {
                      getChartFromApi_BasedTaskTime("year=" +
                          dropdownYear!.vcname.toString() +
                          "&pic=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartFinishedOntime) {
                    if (dropdownYear != null && dropdownPicZone != null) {
                      getChartFromApi_FinishedOntime("year=" +
                          dropdownYear!.vcname.toString() +
                          "&pic=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartWorkOrder) {
                    if (dropdownYear != null && dropdownPicZone != null) {
                      getChartFromApi_WorkOrder("year=" +
                          dropdownYear!.vcname.toString() +
                          "&pic=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartMRCost) {
                    if (dropdownYear != null &&
                        dropdownPicZone != null &&
                        dropdownCcName != null) {
                      getChartFromApi_MRCost("year=" +
                          dropdownYear!.vcname.toString() +
                          "&ccname=" +
                          dropdownCcName!.id.toString() +
                          "&zone=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartComparasionOrder) {
                    if (dropdownYear != null &&
                        dropdownPicZone != null &&
                        dropdownCcName != null) {
                      getChartFromApi_ComparasionOrder("year=" +
                          dropdownYear!.vcname.toString() +
                          "&ccname=" +
                          dropdownCcName!.id.toString() +
                          "&zone=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  } else if (_showChartOrderRatio) {
                    if (dropdownYear != null &&
                        dropdownPicZone != null &&
                        dropdownCcName != null) {
                      getChartFromApi_PmOrderRatio("year=" +
                          dropdownYear!.vcname.toString() +
                          "&ccname=" +
                          dropdownCcName!.id.toString() +
                          "&zone=" +
                          dropdownPicZone!.id.toString());
                    } else {}
                  }
                });
              },
              isDense: true,
              underline: SizedBox.shrink(),
              items: piczoneList?.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item.vcname,
                        style:
                            TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                      ),
                      value: item,
                    );
                  }).toList() ??
                  [],
            )),
      ],
    ));
  }

  Widget filter_status_backlog() {
    return Column(
      children: <Widget>[
        Text(
          'Status Backlog',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
        ),
        SizedBox(height: 5),
        Container(
          height: 40,
          child: RollingSwitch.icon(
            width: 90,
            onChanged: (bool state) {
              print('turned ${(state) ? '1' : '0'}');
              setState(() {
                if (state == true) {
                  _valueSwitch = 1;
                } else if (state == false) {
                  _valueSwitch = 0;
                }
                _isLoading = true;
                if (_showChartBacklogMonth) {
                  if (dropdownYear != null &&
                      dropdownPicZone != null &&
                      _valueSwitch != null) {
                    getChartFromApi_BacklogMonth("year=" +
                        dropdownYear!.vcname.toString() +
                        "&pic=" +
                        dropdownPicZone!.id.toString() +
                        "&backlog=" +
                        _valueSwitch.toString());
                  } else {}
                }
              });
            },
            rollingInfoRight: RollingIconInfo(
              icon: Icons.check,
              backgroundColor: ColorValues().primaryRed,
              text: Text('Yes',
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            rollingInfoLeft: RollingIconInfo(
              icon: Icons.not_interested,
              backgroundColor: Colors.grey,
              text: Text('No',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        // Row(
        //   children: [
        //     MyRadioListTile<int>(
        //         value: 1,
        //         groupValue: _valueRadio,
        //         leading: '1',
        //         onChanged: (value) {
        //           setState(() {
        //             _valueRadio = value!;
        //             _isLoading = true;
        //             if (_showChartBacklogMonth) {
        //               if (dropdownYear != null && dropdownPicZone != null) {
        //                 getChartFromApi_BacklogMonth("year=" +
        //                     dropdownYear!.vcname.toString() +
        //                     "&pic=" +
        //                     dropdownPicZone!.id.toString() +
        //                     "&backlog=" +
        //                     _valueRadio.toString());
        //               } else {}
        //             }
        //           });
        //         }),
        //     MyRadioListTile<int>(
        //         value: 0,
        //         groupValue: _valueRadio,
        //         leading: '0',
        //         onChanged: (value) {
        //           setState(() {
        //             _valueRadio = value!;
        //             _isLoading = true;
        //             if (_showChartBacklogMonth) {
        //               if (dropdownYear != null && dropdownPicZone != null) {
        //                 getChartFromApi_BacklogMonth("year=" +
        //                     dropdownYear!.vcname.toString() +
        //                     "&pic=" +
        //                     dropdownPicZone!.id.toString() +
        //                     "&backlog=" +
        //                     _valueRadio.toString());
        //               } else {}
        //             }
        //           });
        //         }),
        //   ],
        // ),
      ],
    );
  }

  SvgPicture _buildButtonIcon(String icon, Color c) {
    if (icon == 'Asset Management') {
      return SvgPicture.asset(
        'assets/icons/as_icon.svg',
        color: c,
      );
    } else if (icon == 'Asset Performance') {
      return SvgPicture.asset(
        'assets/icons/ap_icon.svg',
        width: 20,
        color: c,
      );
    } else if (icon == 'Loss Registration' ||
        icon == 'Improvement Asset' ||
        icon == 'OEE Journey' ||
        icon == 'OEE Monitoring' ||
        icon == 'Primary Stopped' ||
        icon == 'Breakdown Stopped' ||
        icon == 'Technical/Supply Failure' ||
        icon == 'Technical Failure Area' ||
        icon == 'Weekly Downtime' ||
        icon == 'Daily Downtime' ||
        icon == 'TOP 10 Downtime' ||
        icon == 'TOP 10 DTMonitoring' ||
        icon == 'Comparative Downtime' ||
        icon == 'PDCA Improvement') {
      return SvgPicture.asset(
        'assets/icons/data_icon.svg',
        width: 20,
        color: c,
      );
    } else if (icon == 'Loss Analysis') {
      return SvgPicture.asset(
        'assets/icons/la_icon.svg',
        width: 20,
        color: c,
      );
    } else if (icon == 'Planned Maintenance') {
      return SvgPicture.asset(
        'assets/icons/pm_icon.svg',
        color: c,
      );
    } else if (icon == 'Cost Control') {
      return SvgPicture.asset(
        'assets/icons/cc_icon.svg',
        color: c,
      );
    } else {
      return SvgPicture.asset(
        'assets/icons/other_icon.svg',
        color: c,
      );
    }
  }

  void _getApiHome() async {
    final prefs = await SharedPreferences.getInstance();
    String password = prefs.getString('password').toString();
    String user = prefs.getString('user').toString();
    showWarningDialog("process",
        customMessage: "Proces data.\nThis may take few seconds");
    UserModel result =
        await LoginApi().postLogin(username: user, password: password);
    menuContent = result.menuContent;
    _username = result.username;
    if (result.accesToken.isNotEmpty) {
      // getTitle();
      getTower();
      getMonth();
      getYear();
      getPicZone();
      getCcname();
      setState(() {
        dropdownYear = null;
        dropdownTower = null;
        dropdownMonth = null;
        dropdownTitle = null;
        _buttonTitle = 'Home';
        _showWarning = false;
        _requiredFilter = false;
        _showComment = false;
        _showInfo = false;
        _showChart = false;
        _isShowList1 = true;
        _isShowList2 = false;
        _isShowList3 = false;
        _isShowFilterYearPicCcname = false;
        _isShowFilterYearTowerMonth = false;
        _isShowFilterYearPicStatus = false;
        _isShowFilterYearPic = false;
        _isShowFilterYearTitle = false;
        _isShowFilterYearTower = false;
        _isShowFilterYearCcname = false;
        _isShowFilterTower = false;
        _isShowFilterYear = false;
        _isLoading = false;
      });
      Navigator.pop(context);
    }
  }

  void getChartFromApi_OEEJourney(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_OEEJourney(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _waitLoad = false;
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _waitLoad = false;
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartOEE_Journey = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_OEEMonitoring(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_OEEMonitoring(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data.length == null || data.length == 0 || data.isEmpty) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartOEEMonitoring = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_PrimaryBreakdown(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_PrimaryBreakdown(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data.length == null || data.length == 0 || data.isEmpty) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartPrimaryBreakdownStopped = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_SupplyFailureTechnicalFailureArea(
      String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi()
          .getChartFromApi_SupplyFailureTechnicalFailureArea(
              menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
                  "?" +
                  parameter,
              sp.getString('token').toString());
      setState(() {
        if (data.length == null || data.length == 0 || data.isEmpty) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartSupplyFailureTechnicalFailureArea = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_WeeklyDowntime(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_WeeklyDowntime(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data.length == null || data.length == 0 || data.isEmpty) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartWeeklyDowntime = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_DailyDowntime(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_DailyDowntime(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data.length == null || data.length == 0 || data.isEmpty) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartDailyDowntime = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_Top10Downtime_DTMonitoring(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_Top10Downtime_DTMonitoring(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data.length == null || data.length == 0 || data.isEmpty) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartTop10Downtime_DTMonitoring = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_Comperative_Downtime(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_Comperative_Downtime(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data.length == null || data.length == 0 || data.isEmpty) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartComperativeDowntime = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_PDCA_Improvment(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_PDCA_Improvment(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartPDCA_Improvment = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_BacklogMonth(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_Backlog_Month(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartBacklockMonth = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_BacklogWeek(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_Backlog_Week(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartBacklogWeek = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_WorkPreparation(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_WorkPreparation(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartWorkPreparation = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_PlanningReview(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_PlanningReview(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartPlanningReview = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_BasedTaskTime(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_BasedTaskTime(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartBasedTaskTime = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_FinishedOntime(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_FinishedOntime(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartFinishedOntime = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_WorkOrder(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_WorkOrder(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartWorkOrder = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_MaintenenceCost(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_MaintenenceCost(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartMaintenenceCost = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_ActualCost(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_ActualCostCentrePerMonth(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartActualCost = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_YtdRealization(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    final data = await ChartApi().getChartFromApi_YtdRealization(
        menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
            "?" +
            parameter,
        sp.getString('token').toString());
    setState(() {
      if (data == null) {
        _isLoading = false;
        _requiredFilter = false;
        SharedCode.showAlertDialog(
            context, 'Warning', 'Data not Found', 'warning');
        _showWarning = true;
      } else {
        _isLoading = false;
        _requiredFilter = false;
        _showWarning = false;
        dataChartYtdRealization = data;
        _showChart = true;
      }
    });
  }

  void getChartFromApi_CostDrivers(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_CostDriversVcBudget(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartCostDrivers = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_MROrder(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_MROrderCostDistribution(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartMROrder = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_MRCost(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_MRCostPerZonePic(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartMRCost = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_ComparasionOrder(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_ComparisonPmOrderVsCmOrder(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartComparasionOrder = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getChartFromApi_PmOrderRatio(String parameter) async {
    final sp = await SharedPreferences.getInstance();
    try {
      final data = await ChartApi().getChartFromApi_PmOrderRatio(
          menuContentSubChildrens[indexProductListSubChildrens]['vcurl'] +
              "?" +
              parameter,
          sp.getString('token').toString());
      setState(() {
        if (data == null) {
          _isLoading = false;
          _requiredFilter = false;
          SharedCode.showAlertDialog(
              context, 'Warning', 'Data not Found', 'warning');
          _showWarning = true;
        } else {
          _isLoading = false;
          _requiredFilter = false;
          _showWarning = false;
          dataChartOrderRatio = data;
          _showChart = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Widget wait_load() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.044),
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.13,
          child: Center(child: Text("Please Wait"))),
    );
  }

  Widget list_satu() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.044),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.13,
              child: CarouselSlider.builder(
                carouselController: _listController,
                itemCount: menuContent.length,
                itemBuilder: (BuildContext c, int index, i) {
                  return GestureDetector(
                      onTap: () {
                        _listController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 300),
                        );
                        selected = index;
                        setState(() {
                          print(menuContent[index]['childrens']);
                          menuContentChildrens =
                              menuContent[index]['childrens'];
                          _buttonTitle = menuContent[index]['vcname'];
                          _isShowList1 = false;
                          _isShowList2 = true;
                        });
                      },
                      child: selected == index
                          ? _buildButtonCenter(index)
                          : _buildButton(index));
                },
                options: CarouselOptions(
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  initialPage: 1,
                  viewportFraction: 0.33,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  _listController.previousPage();
                },
                icon: Icon(Icons.arrow_back_ios_outlined)),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  _listController.nextPage();
                },
                icon: Icon(Icons.arrow_forward_ios_outlined)),
          )
        ],
      ),
    );
  }

  Widget list_dua() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.044),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.13,
              child: CarouselSlider.builder(
                carouselController: _listController,
                itemCount: menuContentChildrens.length,
                itemBuilder: (BuildContext c, int index, i) {
                  return GestureDetector(
                      onTap: () {
                        _listController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 300),
                        );
                        setState(() {
                          selected = index;
                          print(menuContentChildrens[index]['childrens']);
                          print(menuContentSubChildrens.length);
                          menuContentSubChildrens =
                              menuContentChildrens[index]['childrens'];
                          _buttonTitle = menuContentChildrens[index]['vcname'];
                          _isShowList1 = false;
                          _isShowList2 = false;
                          _isShowList3 = true;
                        });
                      },
                      child: selected == index
                          ? _buildButtonCenterList2(index)
                          : _buildButtonList2(index));
                },
                options: CarouselOptions(
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  initialPage: 1,
                  viewportFraction: 0.33,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  _listController.previousPage();
                },
                icon: Icon(Icons.arrow_back_ios_outlined)),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  _listController.nextPage();
                },
                icon: Icon(Icons.arrow_forward_ios_outlined)),
          )
        ],
      ),
    );
  }

  Widget list_tiga() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.044),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.13,
              child: CarouselSlider.builder(
                carouselController: _listController,
                options: CarouselOptions(
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  initialPage: 1,
                  viewportFraction: 0.33,
                ),
                itemCount: menuContentSubChildrens.length,
                itemBuilder: (BuildContext c, int index, i) {
                  return GestureDetector(
                      onTap: () {
                        _listController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 300),
                        );
                        setState(() {
                          selected = index;
                          _title = menuContentSubChildrens[index]['vcname'];
                          indexProductListSubChildrens = index;
                          print("index : " + index.toString());
                          print("id : " +
                              menuContentSubChildrens[index]['id'].toString());
                          int idProduct = menuContentSubChildrens[index]['id'];
                          switch (idProduct) {
                            case 7:
                              _waitLoad = true;
                              _isLoading = true;
                              _requiredFilter = false;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;
                              getChartFromApi_OEEJourney("");
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _showInfo = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 8:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_OEEMonitoring(
                              //     "year=" + dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = true;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _showInfo = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = true;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 9:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_PrimaryBreakdown(
                              //     "tower=" + dropdownTower.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = true;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _showInfo = false;
                              _isShowFilterTower = true;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 10:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_PrimaryBreakdown(
                              //     "tower=" + dropdownTower.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = true;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _showInfo = false;
                              _isShowFilterTower = true;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 12:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_SupplyFailureTechnicalFailureArea(
                              //     "tower=" + dropdownTower.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = true;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _showInfo = false;
                              _isShowFilterTower = true;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 13:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_SupplyFailureTechnicalFailureArea(
                              //     "tower=" + dropdownTower.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = true;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _showInfo = false;
                              _isShowFilterTower = true;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 14:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_WeeklyDowntime("tower=" +
                              //     dropdownTower.toString() +
                              //     "&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = true;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _showInfo = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = true;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 15:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_DailyDowntime("tower=" +
                              //     dropdownTower.toString() +
                              //     "&year=" +
                              //     dropdownYear!.vcname.toString() +
                              //     "&month=" +
                              //     dropdownMonth.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = true;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _showInfo = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = true;
                              break;
                            case 17:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = true;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _showInfo = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = true;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 18:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = true;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _showInfo = true;
                              _isShowFilterTower = false;
                              _isShowFilterYear = true;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 19:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = true;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _showInfo = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = true;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 21:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = true;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = true;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 33:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = true;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = true;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 34:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = true;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = true;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 35:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = true;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = true;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 37:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = true;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = true;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 38:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = true;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = true;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 39:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = true;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = true;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 40:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = true;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = true;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 43:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = true;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = true;
                              _isShowFilterYearPicCcname = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 44:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = true;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = true;
                              _isShowFilterYearPicCcname = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 46:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = true;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = true;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 48:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = true;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = true;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 49:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = true;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterTower = false;
                              _isShowFilterYear = true;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 50:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = true;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = true;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = false;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 51:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = true;
                              _showChartOrderRatio = false;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = true;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = true;
                              _isShowFilterYearTowerMonth = false;
                              break;
                            case 52:
                              _isLoading = false;
                              _requiredFilter = true;
                              dropdownYear = null;
                              dropdownTower = null;
                              dropdownMonth = null;
                              dropdownTitle = null;
                              dropdownPicZone = null;
                              dropdownCcName = null;

                              // getChartFromApi_Top10Downtime("&year=" +
                              //     dropdownYear!.vcname.toString());
                              _showComment = true;
                              _showChartOEEMonitoring = false;
                              _showChartPrimaryStopped = false;
                              _showChartBreakdownStopped = false;
                              _showChartSupplyFailure = false;
                              _showChartTechnicalFailureArea = false;
                              _showChartWeeklyDowntime = false;
                              _showChartDailyDowntime = false;
                              _showChartTop10Downtime = false;
                              _showChartTop10DTMonitoring = false;
                              _showChartComparativeDowntime = false;
                              _showChartPDCAImprovment = false;
                              _showChartBacklogMonth = false;
                              _showChartBacklogWeek = false;
                              _showChartWorkPreparation = false;
                              _showChartPlanningReview = false;
                              _showChartFinishedOntime = false;
                              _showChartBasedTaskTime = false;
                              _showChartWorkOrder = false;
                              _showChartMaintenenceCost = false;
                              _showChartYtdRealization = false;
                              _showChartActualCost = false;
                              _showChartCostDrivers = false;
                              _showChartMROrder = false;
                              _showChartMRCost = false;
                              _showChartComparasionOrder = false;
                              _showChartOrderRatio = true;
                              _isShowFilterYearCcname = false;
                              _isShowFilterYearPicCcname = true;
                              _isShowFilterTower = false;
                              _isShowFilterYear = false;
                              _isShowFilterYearTower = false;
                              _isShowFilterYearTitle = false;
                              _isShowFilterYearPicStatus = false;
                              _isShowFilterYearPic = true;
                              _isShowFilterYearTowerMonth = false;
                              break;
                          }
                        });
                      },
                      child: selected == index
                          ? _buildButtonCenterList3(index)
                          : _buildButtonList3(index));
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  _listController.previousPage();
                },
                icon: Icon(Icons.arrow_back_ios_outlined)),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  _listController.nextPage();
                },
                icon: Icon(Icons.arrow_forward_ios_outlined)),
          )
        ],
      ),
    );
  }

  outapp(BuildContext ctx) {
    SharedCode.showAlertDialog(
        context, 'Exit', 'Do you want to exit?', 'warning',
        onButtonPressed: () {
      exit(0);
    });
  }

  void showWarningDialog(String type, {required String customMessage}) {
    String dialogType = "";
    String title = "";
    String message = "";
    IconData icon = Icons.warning;

    switch (type) {
      case "warning":
        dialogType = "warning";
        title = "Review";
        message = customMessage;
        icon = Icons.warning;
        break;
      case "process":
        dialogType = "process";
        title = "Process";
        message = customMessage;
        icon = Icons.hourglass_bottom;
        break;
      case "succeed":
        dialogType = "succeed";
        title = "Succeed";
        message = "Successfully";
        icon = Icons.check_circle_outline;
        break;
      case "error":
        message = customMessage;
        dialogType = "error";
        title = "Error";
        icon = Icons.error;
        break;
      default:
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => new Dialog(
                child: WarningDialog(
              type: dialogType,
              title: title,
              message: message,
              icon: icon,
            )));
  }
}
