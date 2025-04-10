import 'package:hive/hive.dart';
import 'package:humanchain/incident_model.dart';

class Boxes {
  static Box<IncidentModel> getData() => Hive.box<IncidentModel>('incident');
}
