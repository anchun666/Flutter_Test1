import 'package:flutter/material.dart';
import 'package:flutter_test1/Model/News.dart';
import 'package:flutter_test1/home/img_screen.dart';
import 'package:flutter_html/flutter_html.dart';


//最新消息詳細資料
class NewsDetail extends StatelessWidget {
  Result result;
//構造函數
  NewsDetail(this.result) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('最新消息'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //GestureDetector觸發事件
          GestureDetector(
            /*
            * Hero
            *   用途:點擊圖片後，圖片會有一個畫面並且獨立呈現，再次點擊就會回復原狀
            *   實際原理: 實際上是使用兩個不同Route但長得一樣的物件，在中間計算補間動畫
            * */
            child: Hero(
              tag: 'imageHero',
              child: Image.network(
                  '${result.newsImgUrl}'),

            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ImgScreen('${result.newsImgUrl}');
              }));
            },
          ),
          Padding(padding: EdgeInsets.only(left: 16),
            //HTML內容以HTML形式呈現
            child: Html(
               data:result.newsContent,

            ))
        ],
      ),
    );
  }
}
