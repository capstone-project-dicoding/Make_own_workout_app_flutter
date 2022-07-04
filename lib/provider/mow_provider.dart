import 'dart:io';

import 'package:flutter/material.dart';
import 'package:make_own_workout/data/api/api_service.dart';
import 'package:make_own_workout/model/mow_model.dart';
import 'package:http/http.dart' as http;

enum ResultState { loading, noData, hasData, error }

class ListMOWProvider extends ChangeNotifier {
  final ApiService apiService;

  ListMOWProvider({required this.apiService}) {
    fetchMOW();
  }

  MOWModel? _mowModel;

  ResultState _resultState = ResultState.loading;
  String _msg = '';

  MOWModel get mowModel => _mowModel!;

  ResultState get resultState => _resultState;

  String get msg => _msg;

  void fetchMOW() => _fetchMOW();

  Future<dynamic> _fetchMOW() async {
    try {
      _resultState;
      notifyListeners();

      final mow = await ApiService(http.Client()).fetchMOW();
      if (mow.data!.isEmpty) {
        _resultState = ResultState.noData;
        notifyListeners();
        return _msg = 'No Data';
      } else {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _mowModel = mow;
      }
    } on SocketException {
      _resultState = ResultState.error;
      notifyListeners();
      return _msg = "No internet connection";
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _msg = 'Opps Internet kamu tidak terhubung...';
    }
  }
}