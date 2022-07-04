import 'package:flutter/material.dart';
import 'package:make_own_workout/data/db/db_helper.dart';
import 'package:make_own_workout/model/mow_model.dart';
import 'package:make_own_workout/provider/mow_provider.dart';

class DatabaseProvider extends ChangeNotifier {
  final DBHelper dbHelper;

  DatabaseProvider({required this.dbHelper}) {
    _getAlls();
  }

  ResultState? _state;
  ResultState? get state => _state;

  String _message = '';
  String get message => _message;

  List<MOWModel> _mow = [];
  List<MOWModel> get mow => _mow;

  void _getAlls() async {
    _mow = await dbHelper.getAlls();
    if (_mow.length > 0) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addMOW(MOWModel mow) async {
    try {
      await dbHelper.insertMOW(mow);
      _getAlls();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorited(String id) async {
    final favorited = await dbHelper.getMOWById(id);
    return favorited.isNotEmpty;
  }

  void removeMOW(String id) async {
    try {
      await dbHelper.removeMOW(id);
      _getAlls();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
