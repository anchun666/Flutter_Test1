import 'dart:io';
import 'package:dio/dio.dart';
import 'Urls.dart';

class Api {

  // 取回預覽圖
  static Future queryBanner() async{
    Response response;
    response = await Dio().post('$bannerUrl');
    if(response.statusCode == HttpStatus.ok) {
      return response.data;
    }
  }
  // 取回最新消息
  static Future queryNews() async{
    Response response;
    response = await Dio().post('$newsUrl');
    if(response.statusCode == HttpStatus.ok) {
      return response.data;
    }
  }


  // 取回教練消息
  static Future queryCoach() async{
    Response response;
    response = await Dio().post('$newsUrl');
    if(response.statusCode == HttpStatus.ok) {
      return response.data;
    }
  }

  static Future queryAccount(account, password) async{
    Response response;
    // await 此方法須非同步(async)，所以會在 Method 中加入 async

    // act:0928075503 pw:123456789
    // Dio().post(url, data:{內容}) 如果api裡沒有資料，要使用此方法新增資料
    response = await Dio().post('$loginUrl', data:{
      "authcode": "@#ALLEC#@%\$!",
      "centercode": "jx01",
      "memtel": "$account",
      "pw": "$password",
    });
    if(response.statusCode == HttpStatus.ok){
      return response.data;
    }
  }
}