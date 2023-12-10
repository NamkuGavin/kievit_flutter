// To parse this JSON data, do
//
//     final commentListModel = commentListModelFromJson(jsonString);

import 'dart:convert';

CommentListModel commentListModelFromJson(String str) =>
    CommentListModel.fromJson(json.decode(str));

String commentListModelToJson(CommentListModel data) =>
    json.encode(data.toJson());

class CommentListModel {
  CommentListModel({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  String status;
  Data data;

  factory CommentListModel.fromJson(Map<String, dynamic> json) =>
      CommentListModel(
        message: json["message"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.intmenu,
    required this.comments,
    required this.lastPage,
    required this.nextPageUrl,
    required this.currentPage,
    this.prevPageUrl,
    required this.path,
  });

  int intmenu;
  List<Comment> comments;
  int lastPage;
  String nextPageUrl;
  int currentPage;
  dynamic prevPageUrl;
  String path;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        intmenu: json["intmenu"],
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
        lastPage: json["last_page"],
        nextPageUrl: json["next_page_url"].toString(),
        currentPage: json["current_page"],
        prevPageUrl: json["prev_page_url"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "intmenu": intmenu,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "last_page": lastPage,
        "next_page_url": nextPageUrl,
        "current_page": currentPage,
        "prev_page_url": prevPageUrl,
        "path": path,
      };
}

class Comment {
  Comment({
    required this.id,
    required this.comment,
    required this.user,
    required this.createdAt,
  });

  int id;
  String comment;
  String user;
  String createdAt;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        comment: json["comment"],
        user: json["user"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "user": user,
        "created_at": createdAt,
      };
}
