import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:handytest/models/visit.dart';
import 'package:http/http.dart' as http;

Future<Visit> createVisit() async {
  const url = 'https://hub.handy.la/api/v2/calendarEvent/';
  const token = "6pnb0maovvbg311r4dmnnaefaqn9ksqd";

  final newVisit = {
    "recurrence": "",
    "eventStart": "01/03/2024 10:00:00",
    "comment": "",
    "zone": 1,
    "salesForcast": 0,
    "user": "ventas01@handy.la",
    "customer": 9141033,
  };
  final String jsonString = jsonEncode(newVisit);

  final response = await http.post(
    Uri.parse(url),
    headers: {'Authorization': 'Bearer $token'},
    body: jsonString,
  );

  if (response.statusCode == 201) {
    return Visit.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response);
  }
}

class CreateVisit extends StatefulWidget {
  const CreateVisit({super.key});
  @override
  State<CreateVisit> createState() => _CreateVisitState();
}

class _CreateVisitState extends State<CreateVisit> {
  Future<Visit>? _futureVisit;

  FutureBuilder<Visit> buildFutureBuilder() {
    return FutureBuilder<Visit>(
      future: _futureVisit,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.id.toString());
          //} else if (snapshot.hasError) {
        } else {
          return Text('${snapshot.error}');
        }
        //return const CircularProgressIndicator();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _futureVisit = createVisit();
  }

  @override
  Widget build(BuildContext context) {
    return const Text('Prueba');
  }
}
