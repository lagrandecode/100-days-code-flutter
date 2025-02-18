import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sheets Form',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GoogleSheetForm(),
    );
  }
}

class GoogleSheetForm extends StatefulWidget {
  @override
  _GoogleSheetFormState createState() => _GoogleSheetFormState();
}

class _GoogleSheetFormState extends State<GoogleSheetForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _course = TextEditingController();
  String _gender = 'Male'; // Default value

  Future<void> submitData() async {
    final String url = "https://script.google.com/macros/s/AKfycby1nkfkfAHo_YSPkqVupkSF36UHD3EOngB4Oz1lb9qFd1tmNCM2Y4spwaOnd6Rm7VxU/exec"; // Replace with your actual URL

    if (_formKey.currentState!.validate()) {
      Map<String, String> data = {
        "name": _nameController.text,
        "age": _ageController.text,
        "dob": _dobController.text,
        "gender": _gender,
        "course": _course.text
      };

      var response = await http.post(

        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Data submitted successfully!")),
        );
        setState(() {
          _nameController.clear();
          _ageController.clear();
          _dobController.clear();
          _course.clear();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to submit data.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Sheets Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a name";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Age"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter an age";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dobController,
                decoration: InputDecoration(labelText: "Date of Birth"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter date of birth";
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _gender,
                items: ["Male", "Female", "Other"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _gender = newValue!;
                  });
                },
                decoration: InputDecoration(labelText: "Gender"),
              ),
              TextFormField(
                controller: _course,
                decoration: InputDecoration(labelText: "Course"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a course";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitData,
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
