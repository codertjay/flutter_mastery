import 'dart:convert';

import 'package:flutter_mastery/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = 'http://mark.bslmeiyu.com/api';

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse("http://mark.bslmeiyu.com/api/getplaces"));
    try {
      print('loading ');
      if (res.statusCode == 200) {
        print('loading.......');
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        print('was not able to get');
        return <DataModel>[];
      }
    } catch (e) {
      print('error occur'+e);
      return <DataModel>[];
    }
  }
}
