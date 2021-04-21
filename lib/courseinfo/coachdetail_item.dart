import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test1/Model/Coach.dart';

Widget coachDetailItem(Result CoachResult) {

  final listTitle =[
    "學歷","專長","獎項","經歷"
  ];
  final listContent = [
    "${CoachResult.coachContent}","${CoachResult.coachEmpertise}","${CoachResult.coachLicense}","${CoachResult.coachHistory}"];

  return Column(
    children:List.generate(4, (index){
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
          width:10,
      ),
          Padding(
          padding:EdgeInsets.all(16),
          child: Text('${listTitle[index]}',
            style:TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.blue[900]
      )),

      ),
          SizedBox(
            width:10,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('${listContent[index]}',
            style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
      )),
          )
        ],
    );

  }
    )
  );
}