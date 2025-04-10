import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:humanchain/home.dart';
import 'package:humanchain/incident_model.dart';
import 'package:humanchain/reportIncident.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(IncidentModelAdapter());
  await Hive.openBox<IncidentModel>('incident');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
      routes: {
        '/reportIncident': (context) => Reportincident(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
