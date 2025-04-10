import 'package:flutter/material.dart';
import 'package:humanchain/inputField.dart';
import 'package:hive/hive.dart';
import 'package:humanchain/incident_model.dart';

class Reportincident extends StatefulWidget {
  const Reportincident({super.key});

  @override
  State<Reportincident> createState() => _ReportincidentState();
}

class _ReportincidentState extends State<Reportincident> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedSeverity = 'Low';
  final List<String> severity = ['Low', 'Medium', 'High'];
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
  void save() async {
  if (_titleController.text.isEmpty || _descriptionController.text.isEmpty || _selectedDate == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Please fill all fields and select a date")),
    );
    return;
  }

  final newIncident = IncidentModel(
    title: _titleController.text.trim(),
    description: _descriptionController.text.trim(),
    severity: _selectedSeverity,
    date: _selectedDate!,

  );

  final box = await Hive.openBox<IncidentModel>('incident');
  box.add(newIncident);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Incident saved successfully")),
  );

  _titleController.clear();
  _descriptionController.clear();
  setState(() {
    _selectedSeverity = 'Low';
    _selectedDate = null;
  });
}

Widget saveButton(BuildContext context){
  return Center(
    child:SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
        child: Expanded(
      child: TextButton(
        onPressed: save,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.lightBlueAccent),
        ),
        child: Text('Save', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
      ),
    )
    ),
      );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Report Incident',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(
              hintText: "Title",
              controller: _titleController,
            ),
            const SizedBox(height: 15),
            InputField(
              hintText: "A short description",
              controller: _descriptionController,
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: _selectedSeverity,
              decoration: const InputDecoration(
                labelText: 'Severity',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(),
              ),
              items: severity.map((String severity) {
                return DropdownMenuItem<String>(
                  value: severity,
                  child: Text(severity),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSeverity = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              "Date of Incident",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _pickDate(context),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                width: double.infinity,
                child: Text(
                  _selectedDate != null
                      ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                      : "Select Date",
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ),
            ),
            const SizedBox(height: 8),
          saveButton(context),
          ],
        ),
      ),
    );
  }
}
