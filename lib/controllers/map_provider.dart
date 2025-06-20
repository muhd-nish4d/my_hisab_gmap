import 'package:flutter/material.dart';

import '../models/map_point_model.dart';

class MapProvider extends ChangeNotifier {
  List<MapPointModel> _points = []; // points
  bool _isLoading = true; // show loading
  String? _errorMessage; // show error
  int? _buildTime; // show taken time

  List<MapPointModel> get points => _points;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  int? get buildTime => _buildTime;

  MapProvider() {
    // get all the points from the json data
    loadPoints();
  }

  Future<void> loadPoints() async {
    // start the stop watch (for know the time)
    final stopwatch = Stopwatch()..start();
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      _points = await loadPointsFromJson();

      if (_points.isEmpty) {
        _errorMessage = 'No points found in the JSON file.';
      } else {
        _errorMessage = null;
      }
      stopwatch.stop();
      _buildTime = stopwatch.elapsedMilliseconds;
    } catch (e) {
      _errorMessage = 'Failed to load points: $e';
      debugPrint('Error loading points: $e');
    }
    _isLoading = false;
    notifyListeners();
  }
}
