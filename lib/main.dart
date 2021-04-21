import 'package:flutter/material.dart';
import 'package:flutter_test1/home/Home.dart';
import 'package:flutter_test1/courseinfo/Courseinfo.dart';
import 'package:flutter_test1/member/Member.dart';
import 'package:provider/provider.dart';
import 'login/login_page.dart';
import 'login/login_provider.dart';



void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => LoginProvider(),
    child: MyApp(),
  ));
}
//StatelessWidget用於單純顯示資料使用
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,),
        debugShowCheckedModeBanner: false, //去除上方debug
      home: MyHomePage(title: 'Flutter Demo Home Page'),

      //Navigator.pushNamed使用前的預先設定
      initialRoute: '/',
      routes:{
        "/":(context) => LoginPage(),
        ":/home":(context) => Home(),
      }
    );
  }
}
//StatefulWidget用於更改資料使用
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
// createState()：運用createState()來覆寫創建對象的狀態
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

//下方Navbar點擊的頁面
  int pageIndex = 0;
//下方Navbar頁面裡的內容
  final pages= [
    Home(),
    CourseInfo(),
    Member(),
    //LoginPage(),
  ];
  /*static const List<Widget>  _widgetOptions = <Widget>[
    Text(
    'Index 0 : Home',
    ),
    Text(
  'Index 1 : Business',
  ),
  Text(
  'Index 2 : School',
  ),
  ];*/

  /*void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }*/

// 當系統認為或有設定都準備完成後，就會呼叫 build() 來進行畫面建構 Scaffold
  @override
  Widget build(BuildContext context) {
    // Scaffold 類似骨架，骨架裡可以放置多種類別
    return Scaffold(
      //內容
      body:pages[pageIndex],
      //bottomNavigationBar位於App下方的選項列
      bottomNavigationBar: BottomNavigationBar(
        items:[
          //選項樣式和名稱
          BottomNavigationBarItem(icon:Icon(Icons.home),label:'首頁'),
          BottomNavigationBarItem(icon:Icon(Icons.list),label:'最新消息'),
          BottomNavigationBarItem(icon:Icon(Icons.account_circle),label:'會員中心'),
          BottomNavigationBarItem(icon:Icon(Icons.account_circle_sharp),label:'登入'),



    ],
        backgroundColor:Colors.grey[800],
        unselectedItemColor: Colors.white,
        fixedColor:Colors.amber,// 選擇頁顏色
        //根據傳進來的Index去做當前顯示頁數
        currentIndex:pageIndex,

        //回傳點擊Index並儲存，用於setState設定
        onTap: (index) {
          //setState():當需要畫面更新時，就會呼叫此函數，並觸發 build()進重建 Scaffold
          setState(() {
            pageIndex = index;
          });
        },



      ),
      /*body: Center(
        child: _widgetOptions[pageIndex]
      ),*/
      /*Text('$count',
        style: TextStyle(
          fontSize: 28,
        ),),*/
      //下方圓形按鈕
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.adb),
      //   onPressed: () {
      //     setState(() {
      //       count += 1;
      //     });
      //   },
      // ),
    );
  }
}