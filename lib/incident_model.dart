import 'package:hive/hive.dart';

part 'incident_model.g.dart';

@HiveType(typeId: 0)
class IncidentModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String severity;

  @HiveField(3)
  final DateTime date;

  IncidentModel({
    required this.title,
    required this.description,
    required this.severity,
    required this.date,
  });
}
