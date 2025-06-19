import 'package:flutter/material.dart';

import '../models/map_point_model.dart';

class MapProvider extends ChangeNotifier {
  List<MapPointModel> _points = [];
  bool _isLoading = true;
  String? _errorMessage;
  int? _buildTime;

  List<MapPointModel> get points => _points;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  int? get buildTime => _buildTime;

  MapProvider() {
    loadPoints();
  }

  Future<void> loadPoints() async {
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
