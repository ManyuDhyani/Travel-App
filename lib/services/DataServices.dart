import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_app/models/ActivityModel.dart';

class DataServices {
  String baseURL = "http://mark.bslmeiyu.com/api";
  Future<List<ActivityModel>> getInfo() async {
    var apiURL = '/getplaces';
    http.Response response = await http.get(Uri.parse(baseURL + apiURL));
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = jsonDecode(response.body);
        return list.map((e) => ActivityModel.fromJson(e)).toList();
      }
      return <ActivityModel>[];
    } catch (e) {
      print(e);
      return <ActivityModel>[];
    }
  }
}
