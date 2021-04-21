import 'package:flutter/material.dart';
import 'package:flutter_test1/Api/Api.dart';
import 'package:flutter_test1/Model/Banners.dart';
import 'package:flutter_test1/Model/News.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_test1/home/news_detail.dart';
import 'package:flutter_test1/login/login_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Banners banners;
  int bannersLength = 0;

  News news;
  int newsLength = 0;

  //創建Method(取Banner資料)
  void queryBanner() {
    //.then就是Future的用法之一
    //value就是Api.dart裡對應方法中的回傳值(response.date)
    Api.queryBanner().then((value) {
      banners = Banners.fromJson(value);
      bannersLength = banners.data.result.length;
    });
  }

  void queryNews() {
    Api.queryNews().then((value) {
      news = News.fromJson(value);
      newsLength = news.data.result.length;
    });
  }

  // initState() ：進行初始化的工作，並在生命週期裡只執行一次
  @override
  void initState() {
    super.initState();
    queryBanner();
    queryNews();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        appBar: AppBar(
          title: Text('首頁'),actions: <Widget>[
            ElevatedButton(
              onPressed:(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text('登入',style: TextStyle(fontSize: 20),
              ),
            )
        ],
        ),

        //內容
        body: FutureBuilder(
          // wait() : 等待所有的future完成後再一起返回,如果中間過程中又任意一個Future出錯,則整個失敗
          future: Future.wait([
            Api.queryBanner(),
            Api.queryNews()
          ]),
          // context：當前APP的內容
          // snapshot：Future.wait()執行完後放入snapshot
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                // Loading 符號 (轉圈圈)
                child: CircularProgressIndicator(),
              );
            }
            banners = Banners.fromJson(snapshot.data[0]);
            bannersLength = banners.data.result.length;
            news = News.fromJson(snapshot.data[1]);
            newsLength = news.data.result.length;

            return
              // 讓首頁可以上下移動
              ListView.builder(
                /*
              *  itemBuilder 用途在於定義捲動時元件的生成方式
              *  Parameter:
              *     - context = 當前APP畫面內容(不確定)
              *     - index = 生成元件的數量，由 itemCount 變數來做設定。
              */
                //【News】itemBuilder
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        Container(
                          height: 300,

                          // Swiper 輪播插件：可讓多張圖片進行有順序的播放，用此類別需另外安裝
                          child: Swiper(
                            // 【Banners】itemBuilder
                            itemBuilder: (BuildContext context, int index) {
                              return Image.network(
                                "${banners.data.result[index].bannerImageName}",
                                fit: BoxFit.fill,
                              );
                            },
                            duration: 1000,
                            itemCount: bannersLength,
                            itemWidth: width,
                            itemHeight: 300,
                            layout: SwiperLayout.STACK,
                            autoplay: true,
                            pagination: SwiperPagination(),
                            control: SwiperControl(),
                          ),
                        ),

                        SizedBox(height: 20,),

                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Icon(Icons.map),
                            SizedBox(width: 20,),
                            Text('臺北市松山區光復北路11巷33號', style: TextStyle(
                              fontSize: 18,),),
                          ],
                        ),

                        SizedBox(height: 20,),

                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Icon(Icons.phone),
                            SizedBox(width: 20,),
                            Text('0912345678', style: TextStyle(
                              fontSize: 18,),),
                          ],
                        ),

                        //水平分割線
                        Divider(),
                        Container(
                          color: Colors.black,
                          child: Row(
                            children: [
                              SizedBox(width: 20,),
                              Icon(Icons.fiber_new,
                                  color: Colors.yellow),
                              SizedBox(width: 20,),
                              Text('最新消息', style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white
                              ),),
                            ],
                          ),
                        )
                      ],
                    );
                  }
                  // 還有GestureDetector可參考
                  //InkWell：用在需要將某物件進行觸發事件所使用，也可以使用 GestureDetector
                  return GestureDetector(
                    // 最新消息列表
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Container(
                            child: Row(
                              children: [
                                SizedBox(width: 20,),
                                Icon(Icons.whatshot),
                                //放入News的資料
                                Text(
                                  '${news.data.result[index].newsFirstTitle}',
                                  style: TextStyle(fontSize: 18,),)
                              ],
                            )
                        ),
                        SizedBox(height: 20,),
                        Container(
                            child: Row(
                              children: [
                                SizedBox(width: 20,),
                                Text('${news.data.result[index].newsSecTitle}',
                                  style: TextStyle(fontSize: 18,),)
                              ],
                            )
                        ),
                        Divider(color: Colors.black,)
                      ],
                    ),


                    // 最新消息點擊事件
                    onTap: () {
                      final passData = news.data.result[index];

                      /*
                    * Navigator 用途在於管理進出頁面的機制，本身是一個Stack(堆疊)
                    * Method:
                    *     - push(): 將目標頁面堆疊在當前頁面上
                    *     - pop(): 將目標頁面彈出並回到前一個頁面
                    */
                      /*
                    * MaterialPageRoute 是一個 Material 元件庫的一個 Widget，用途可以實現頁面切換時風格一致
                    *   對於Android，
                    *   打開新頁面時，新的頁面會從屏幕底部滑動到屏幕頂部；
                    *   關閉頁面時，當前頁面會從屏幕頂部滑動到屏幕底部後消失，同時上一個頁面會顯示到屏幕上。
                    *   對於iOS，
                    *   當打開頁面時，
                    *   新的頁面會從屏幕右側邊緣一致滑動到屏幕左邊，直到新頁面全部顯示到屏幕上，而上一個頁面則會從當前屏幕滑動到屏幕左側而消失；
                    *   關閉頁面時，正好相反，當前頁面會從屏幕右側滑出，同時上一個頁面會從屏幕左側滑入。
                    */
                      Navigator.push(context,MaterialPageRoute(
                          builder: (context) => NewsDetail(passData)));
                    },
                  );
                },
                itemCount: newsLength,

              );
          },
        )
    );
  }
}