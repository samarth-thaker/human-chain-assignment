import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:humanchain/boxes.dart';
import 'package:humanchain/incident_model.dart';
import 'package:humanchain/incident_tile.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recent Accidents',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<IncidentModel>>(
          valueListenable: Boxes.getData().listenable(),
          builder: (context, box, _) {
            final incidents = box.values.toList().cast<IncidentModel>();

            if (incidents.isEmpty) {
              return const Center(child: Text('No incidents reported yet.'));
            }

            return ListView.builder(
                itemCount: incidents.length,
                itemBuilder: (context, index) {
                  final incident = incidents[index];

                  return IncidentTile(
                      title: incident.title,
                      description: incident.description,
                      severity: incident.severity,
                      date: incident.date);
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, '/reportIncident')},
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
