import 'dart:convert';

import 'package:make_own_workout/model/mow_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://capstone-project-dicoding-2022.herokuapp.com';

  final http.Client client;

  ApiService(this.client);

  Future<MOWModel> fetchMOW() async {
    final _url = Uri.parse('$_baseUrl/api/v1/fitness');
    final response = await http.get(_url);

    if(response.statusCode == 200) {
      return MOWModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  } 
}