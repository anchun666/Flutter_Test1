import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test1/home/Home.dart';
import 'package:flutter_test1/main.dart';
import 'package:flutter_test1/Api/Api.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var accountCtor = TextEditingController();
  var pwdCtor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        title: Text('登入'),

    ),




         floatingActionButton: FloatingActionButton(
         onPressed:(){



         },
         tooltip: 'Increment',
           child: Icon(Icons.add),

        ),
      body: SingleChildScrollView(
        child:Column(
          children: <Widget>[
            Center(
              child:Image.asset('assets/images/0420.png'),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 8,vertical: 16),
              child:TextField(
                controller:accountCtor,
                decoration:InputDecoration(
                hintText:'請輸入帳號',
              ),
              )
            ),
            Padding(
                padding:EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                child:TextField(
                  controller:pwdCtor,
                  decoration:InputDecoration(
                    hintText:'請輸入密碼',
                  ),
                )
            ),
            Container(
              width:MediaQuery.of(context).size.width,
              child:Padding(
                padding:const EdgeInsets.all(16.0),
                child:ElevatedButton(
                  child:Text('登入',style:TextStyle(fontSize: 20),),
                  onPressed:() {
                    if (accountCtor.text == '0928075503') {
                      print('帳號:${accountCtor.text}');
                      if (pwdCtor.text == '123456789') {
                        print('密碼:${pwdCtor.text}');
                        Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage()));
                      }

                  }




                  },
              ),
              ),
            ),
            Center(
              child:Image.asset('assets/images/0420.png'),
            ),
            Center(
              child:Image.asset('assets/images/0420.png'),
            ),
          ],
        )
      )
    );

  }
}
