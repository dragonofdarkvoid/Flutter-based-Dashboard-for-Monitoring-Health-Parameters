import 'dart:async';
import 'dart:convert';

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

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      title: 'MEDICAL CHECK-UP',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 2, 118, 126),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(111, 7, 136, 119),
          title: Container(
            child: Column(children: <Widget>[
              Text(
                'MEDICAL CHECK-UP',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
            ]),
          ),
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
                    height: 570,
                    width: 500,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 10, 41, 41),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data![index].name,
                          style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("                   "),
                            Text(
                              "HeartRate :",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text(
                              "${snapshot.data![index].heartrate}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text(
                              "BPM",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text("          "),
                            Text(
                              "Oxygen :",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text(
                              "${snapshot.data![index].oxygen}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text("          "),
                            Text(
                              "Systole :",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text(
                              "${snapshot.data![index].systole}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text(
                              "mmHg",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text("          "),
                            Text(
                              "Diastole :",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text(
                              "${snapshot.data![index].diastole}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text(
                              "mmHg",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text("          "),
                            Text(
                              "BodyTemp :",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text(
                              "${snapshot.data![index].body_temp}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text(
                              "^C",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
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
