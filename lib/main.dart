import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/map_provider.dart';
import 'screens/map/map_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MapProvider())],
      child: MaterialApp(
        title: 'Hisaab Map',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const ScreenMap(),
      ),
    );
  }
}
