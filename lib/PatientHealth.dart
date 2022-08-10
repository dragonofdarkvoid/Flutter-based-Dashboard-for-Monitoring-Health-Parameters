import 'dart:async';
import 'dart:convert';
import 'package:charcode/ascii.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'postList.dart';

Future<List<Post>> fetchPost() async {
  final response = await http
      .get(Uri.parse('http://192.168.43.8:8080/Patientdata/patientdata'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Post>((json) => Post.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

void main() => runApp(PatientHealth());

class PatientHealth extends StatefulWidget {
  @override
  _PatientHealthState createState() => _PatientHealthState();
}

class _PatientHealthState extends State<PatientHealth> {
  late Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 2, 118, 126),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Patients Data'),
          backgroundColor: Color.fromARGB(111, 7, 136, 119),
        ),
        body: FutureBuilder<List<Post>>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                reverse: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 9, 35, 49),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data![index].name,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "HeartRate :",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${snapshot.data![index].heartrate}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "BPM",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text("     "),
                            Text(
                              "Oxygen :",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${snapshot.data![index].oxygen}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text("     "),
                            Text(
                              "Systole :",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${snapshot.data![index].systole}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "mmHg",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text("     "),
                            Text(
                              "Diastole :",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${snapshot.data![index].diastole}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "mmHg",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text("     "),
                            Text(
                              "BodyTemp :",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${snapshot.data![index].body_temp}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "^C",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text("  "),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
