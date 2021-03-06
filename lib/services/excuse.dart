import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:excuses/models/excuse.dart';

class ExcuseService {
  Future<List<Excuse>> fetchExcuses() async {
    try {
      Response response = await Dio().get(
          'https://s3.ap-south-1.amazonaws.com/idontlikework/wfh-reasons.json');

      List<dynamic> json = jsonDecode(response.data);
      var excuses = json.map((json) => Excuse.fromJson(json)).toList();

      return excuses;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
