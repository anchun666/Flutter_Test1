import 'package:flutter/material.dart';
import 'package:flutter_test1/Api/Api.dart';
import 'package:flutter_test1/Model/Coach.dart';
import 'package:flutter_test1/courseinfo/coach_item.dart';
import 'package:flutter_test1/courseinfo/course_item.dart';

class CourseInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length:2,
        child:Scaffold(
        appBar: AppBar(
        bottom: TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.white,
        tabs: [
             Tab(text:'課程'),
             Tab(text: '教練'),
    ],
    ),
            title: Text('Tabs Demo'),
    ),
            body: FutureBuilder(
    future: Api.queryCoach(),
    builder: (context,snapshot){
    if(!snapshot.hasData){
                  return Center(
                   child: CircularProgressIndicator(),
    );
    }

    //有資料
    var coachData = Coach.fromJson(snapshot.data);
    return
                   TabBarView(
                     children:[
                            CourseItem(),
                            CoachItem(coachData),
    ],
    );
  }

  ,

  )

  )

  );
}}