import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<MapPointModel>> loadPointsFromJson() async {
  final mapPoints = await rootBundle.loadString(
    'assets/json/myHisaab-May 13 2025.json',
  );
  final Map<String, dynamic> jsonData = jsonDecode(mapPoints);
  return jsonData.entries.map((entry) {
    final data = entry.value;
    return MapPointModel(
      lat: double.parse(data['geo_lat']),
      lng: double.parse(data['geo_long']),
      accuracy: double.parse(data['accuracy']),
    );
  }).toList();
}

class MapPointModel {
  final double lat;
  final double lng;
  final double accuracy;
  MapPointModel({required this.lat, required this.lng, required this.accuracy});
}
