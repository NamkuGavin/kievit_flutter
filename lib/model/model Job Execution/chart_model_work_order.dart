// To parse this JSON data, do
//
//     final workOrderModel = workOrderModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

WorkOrderModel workOrderModelFromJson(String str) =>
    WorkOrderModel.fromJson(json.decode(str));

String workOrderModelToJson(WorkOrderModel data) => json.encode(data.toJson());

class WorkOrderModel {
  WorkOrderModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  WorkOrderData data;

  factory WorkOrderModel.fromJson(Map<String, dynamic> json) => WorkOrderModel(
        message: json["message"],
        status: json["status"],
        data: WorkOrderData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class WorkOrderData {
  WorkOrderData({
    required this.notificationRegistered,
    required this.forSafetyLegalQuality,
  });

  NotificationRegistered notificationRegistered;
  ForSafetyLegalQuality forSafetyLegalQuality;

  factory WorkOrderData.fromJson(Map<String, dynamic> json) => WorkOrderData(
        notificationRegistered:
            NotificationRegistered.fromJson(json["Notification Registered"]),
        forSafetyLegalQuality:
            ForSafetyLegalQuality.fromJson(json["For Safety, Legal, Quality"]),
      );

  Map<String, dynamic> toJson() => {
        "Notification Registered": notificationRegistered.toJson(),
        "For Safety, Legal, Quality": forSafetyLegalQuality.toJson(),
      };
}

class ForSafetyLegalQuality {
  ForSafetyLegalQuality({
    required this.notifReg,
    required this.notifDelete,
    required this.notifClose,
    required this.notifOpen,
    required this.notifBacklog,
    required this.notifRemind,
    required this.incomingOrder,
  });

  String notifReg;
  int notifDelete;
  int notifClose;
  int notifOpen;
  int notifBacklog;
  int notifRemind;
  int incomingOrder;

  factory ForSafetyLegalQuality.fromJson(Map<String, dynamic> json) =>
      ForSafetyLegalQuality(
        notifReg: json["notif_reg"],
        notifDelete: json["notif_delete"],
        notifClose: json["notif_close"],
        notifOpen: json["notif_open"],
        notifBacklog: json["notif_backlog"],
        notifRemind: json["notif_remind"],
        incomingOrder: json["incoming_order"],
      );

  Map<String, dynamic> toJson() => {
        "notif_reg": notifReg,
        "notif_delete": notifDelete,
        "notif_close": notifClose,
        "notif_open": notifOpen,
        "notif_backlog": notifBacklog,
        "notif_remind": notifRemind,
        "incoming_order": incomingOrder,
      };
}

class NotificationRegistered {
  NotificationRegistered({
    required this.notifReg,
    required this.notifDelete,
    required this.notifClose,
    required this.percentageClose,
    required this.notifOpen,
    required this.percentageOpen,
    required this.notifBacklog,
    required this.percentageBacklog,
    required this.notifRemind,
    required this.incomingOrder,
  });

  String notifReg;
  int notifDelete;
  int notifClose;
  double percentageClose;
  int notifOpen;
  double percentageOpen;
  int notifBacklog;
  double percentageBacklog;
  int notifRemind;
  int incomingOrder;

  factory NotificationRegistered.fromJson(Map<String, dynamic> json) =>
      NotificationRegistered(
        notifReg: json["notif_reg"],
        notifDelete: json["notif_delete"],
        notifClose: json["notif_close"],
        percentageClose: json["percentage_close"].toDouble(),
        notifOpen: json["notif_open"],
        percentageOpen: json["percentage_open"].toDouble(),
        notifBacklog: json["notif_backlog"],
        percentageBacklog: json["percentage_backlog"].toDouble(),
        notifRemind: json["notif_remind"],
        incomingOrder: json["incoming_order"],
      );

  Map<String, dynamic> toJson() => {
        "notif_reg": notifReg,
        "notif_delete": notifDelete,
        "notif_close": notifClose,
        "percentage_close": percentageClose,
        "notif_open": notifOpen,
        "percentage_open": percentageOpen,
        "notif_backlog": notifBacklog,
        "percentage_backlog": percentageBacklog,
        "notif_remind": notifRemind,
        "incoming_order": incomingOrder,
      };
}
