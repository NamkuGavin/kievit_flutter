import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kievit_flutter/model/comment_model.dart';
import 'package:kievit_flutter/shared/shared_code.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../shared/color_values.dart';

class commentPage extends StatefulWidget {
  final String id;
  final String title;
  const commentPage({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  State<commentPage> createState() => _commentPageState();
}

class _commentPageState extends State<commentPage> {
  DateFormat inputFormat = DateFormat('dd-MM-yyyy hh:mm:ss');
  CommentListModel? commentListModel;
  int page = 1;
  bool _isLoading = true;
  bool _isRefresh = false;
  final controller = ScrollController();
  List<Comment> items = [];
  TextEditingController textcontroller = TextEditingController();

  @override
  void initState() {
    getComment();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        getComment();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  postComment() async {
    setState(() {
      _isRefresh = true;
    });
    final sp = await SharedPreferences.getInstance();
    String url = "https://be-kievit.smkrus.com/api/chart/comments/" +
        widget.id +
        "?txtcomment=" +
        textcontroller.text.toString();
    Map<String, String> headers = {
      'Authorization': 'Bearer ' + sp.getString('token').toString(),
      'Content-Type': 'application/json'
    };
    print(url);
    var respon = await http.post(Uri.parse(url), headers: headers);
    Map<String, dynamic> body = jsonDecode(respon.body);
    if (respon.statusCode == 200) {
      setState(() {
        page = 1;
        _isRefresh = false;
        items.clear();
      });
      String status = body['status'];
      print("Status: " + status.toString());
      if (status == "Success") {
        getComment();
      }
    }
    textcontroller.clear();
  }

  getComment() async {
    final sp = await SharedPreferences.getInstance();
    String url = "https://be-kievit.smkrus.com/api/chart/comments/" +
        widget.id +
        "?page=$page";
    Map<String, String> headers = {
      'Authorization': 'Bearer ' + sp.getString('token').toString(),
      'Content-Type': 'application/json'
    };
    print(url);
    var res = await http.get(Uri.parse(url), headers: headers);

    if (res.statusCode == 200) {
      commentListModel =
          CommentListModel.fromJson(json.decode(res.body.toString()));
      items.addAll(commentListModel!.data.comments);
      print("Data: ");
      setState(() {
        page += 1;
        print(commentListModel?.data);
        if (commentListModel!.data.nextPageUrl == "null") {
          _isLoading = false;
          SharedCode.showSnackBar(
              context, 'success', 'All Comment has been loaded');
        }
        // items.asMap().forEach((key, value) {
        //   print("Data : " + value.comment);
        //   items.add(value.comment);
        // });
        // items.addAll(newItems.map<String>((item) {
        //   final number = item['comment'];
        //   return '$number';
        // }).toList());
      });
    } else {
      Map<String, dynamic> body = jsonDecode(res.body);
      setState(() {
        _isLoading = false;
      });
      SharedCode.showSnackBar(context, 'warning', body['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.21,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorValues().primaryRed),
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Comment for " + widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Builder(
                builder: (context) {
                  var height = MediaQuery.of(context).size.height;
                  return Container(
                      height: height * 0.6,
                      child: _isRefresh
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : ListView.builder(
                              physics: _isLoading
                                  ? NeverScrollableScrollPhysics()
                                  : ScrollPhysics(),
                              controller: controller,
                              itemCount: items.length + 1,
                              itemBuilder: (context, index) {
                                if (index < items.length) {
                                  return ListTile(
                                      title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    scale: 2,
                                                    image: AssetImage(
                                                        "assets/icons/user_icon.png")),
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(17)),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02),
                                          Text(
                                            items[index].user + ', ',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            DateFormat('yy/MM/d HH:mm').format(
                                                    inputFormat.parse(
                                                        items[index]
                                                            .createdAt)) +
                                                ' : ',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontStyle: FontStyle.italic,
                                                color:
                                                    ColorValues().primaryRed),
                                          ),
                                          Text(
                                            items[index].comment,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                        thickness: 0.5,
                                      ),
                                    ],
                                  ));
                                } else {
                                  return _isLoading
                                      ? Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12),
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        )
                                      : Container();
                                }
                              }));
                },
              ),
              Container(
                color: Colors.grey.shade100,
                height: MediaQuery.of(context).size.height * 0.17,
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: textcontroller,
                  style: TextStyle(fontSize: 15),
                  textCapitalization: TextCapitalization.sentences,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Type your comment',
                    hintStyle: TextStyle(fontSize: 13),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: ColorValues().primaryRed,
                        size: 16,
                      ),
                      onPressed: () async {
                        postComment();
                      },
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
