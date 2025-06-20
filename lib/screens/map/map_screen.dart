import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gmap/controllers/map_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class ScreenMap extends StatelessWidget {
  const ScreenMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MapProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              // Show Loading
              ? Center(child: CircularProgressIndicator())
              : provider.errorMessage != null
              // Show if have any error
              ? Center(child: Text(provider.errorMessage!))
              : Stack(
                  children: [
                    // Map widget
                    FlutterMap(
                      options: MapOptions(
                        initialZoom: provider.points.isNotEmpty ? 16 : 5,
                        initialCenter: provider.points.isNotEmpty
                            ? LatLng(
                                provider.points[0].lat,
                                provider.points[0].lng,
                              )
                            : LatLng(0, 0),
                      ),
                      children: [
                        // Load Map
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        if (provider.points.isNotEmpty)
                          // Connecting all the points with a blue line
                          PolylineLayer(
                            polylines: [
                              Polyline(
                                points: provider.points
                                    .map((e) => LatLng(e.lat, e.lng))
                                    .toList(),
                                color: Colors.blue,
                                strokeWidth: 4,
                              ),
                            ],
                          ),
                        if (provider.points.isNotEmpty)
                          // Draw circle on points
                          CircleLayer(
                            circles: provider.points.map((point) {
                              return CircleMarker(
                                point: LatLng(point.lat, point.lng),
                                color: Colors.blue.withValues(alpha: 0.3),
                                borderColor: Colors.blue,
                                borderStrokeWidth: 1,
                                radius: point.accuracy,
                                useRadiusInMeter: true,
                                // _adjustRadius(
                                //   point.accuracy,
                                //   provider.currentZoomLevel,
                                // ),
                              );
                            }).toList(),
                          ),
                        if (provider.points.isNotEmpty)
                          // For mark start and end
                          MarkerLayer(
                            markers: [
                              Marker(
                                width: 40,
                                height: 40,
                                point: LatLng(
                                  provider.points.first.lat,
                                  provider.points.first.lng,
                                ),
                                child: Icon(
                                  Icons.flag,
                                  color: Colors.green,
                                  size: 40,
                                ),
                              ),
                              Marker(
                                width: 40,
                                height: 40,
                                point: LatLng(
                                  provider.points.last.lat,
                                  provider.points.last.lng,
                                ),
                                child: Icon(
                                  Icons.flag,
                                  color: Colors.red,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    // For show how much time taken
                    SafeArea(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Map build in ${provider.buildTime} ms',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  // double _adjustRadius(double accuracy, double zoom) {
  //   return accuracy * (zoom / 30);
  // }
}
