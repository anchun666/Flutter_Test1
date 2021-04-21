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

  // act:0928075503 pw:123456789
  // Dio().post(url, data:{內容}) 如果api裡沒有資料，要使用此方法新增資料
  static Future queryAccount() async{
    Response response;
    response = await Dio().post('$loginUrl',data:
      {
          "rs": 0,
          "rsmessage": "成功",
          "centercode": "jx01",
          "levelname": "",
          "eweektimes": 0,
          "memptype": 0
      }


    );
    if(response.statusCode == HttpStatus.ok) {
      return response.data;
    }
  }


}