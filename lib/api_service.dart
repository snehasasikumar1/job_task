
import 'dart:convert';

import 'package:employee/Usermodel.dart';
import 'package:http/http.dart' as http;
class FetchUser{
  var data=[];
  List<userlist> results=[];
  String fetchurl="https://www.mocky.io/v2/5d565297300000680030a986";
  Future<List<userlist>>getUserList({String? query})async{
    var url=Uri.parse(fetchurl);
    var respose=await http.get(url);
    try {
  if(respose.statusCode==200){
    data=json.decode(respose.body);
    results=data.map((e) => userlist.fromJson(e)).toList();
    if (query!= null){
          results = results.where((element) => element.name!.toLowerCase().contains((query.toLowerCase()))).toList();
        }
  }
  else{
    print('api error');
  }
} on Exception catch (e) {
  print('error:$e');
}
return results;

  }
}