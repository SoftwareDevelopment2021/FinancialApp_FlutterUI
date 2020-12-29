import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class etfProvider extends ChangeNotifier{
  int loading_num=10;
  void loading(){
    loading_num+=10;notifyListeners();
  }
  Future getetf(BuildContext context) async {
    var screenSize=MediaQuery.of(context).size;
    const String url = 'https://15d1fp48yg.execute-api.us-east-1.amazonaws.com/dev/etfs';
    try {
      var response = await http.get(Uri.encodeFull(url));
      var convertDataToJson = jsonDecode(response.body);
      return convertDataToJson['data'];
    } catch (e) {
      print(e);
      throw Padding(
        padding: EdgeInsets.only(top: screenSize.width/8),
        child: Center(
          child: Text('Time Deposit is not available',style: TextStyle(color: Colors.white,fontSize: screenSize.width/20),),
        ),
      );
    }
  }
}