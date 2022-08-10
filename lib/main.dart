import 'package:flutter/material.dart';
import './Navigation.dart' as navigation;
import './FaceRecognition.dart' as facerecog;
import './MedicalCheck-Up.dart' as mcu;
import './PatientHealth.dart' as patienthealth;
import './Administration.dart' as admin;

void main() {
  runApp(
      new MaterialApp(debugShowCheckedModeBanner: false, home: new rovidui()));
}

class rovidui extends StatefulWidget {
  @override
  roviduiState createState() => new roviduiState();
}

class roviduiState extends State<rovidui> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color.fromARGB(255, 66, 66, 66),
        appBar: new AppBar(
            title: new Text(
                "MR-IAT || Medical Robot - controlled Intelligent Assistive Technology"),
            backgroundColor: Color.fromARGB(255, 18, 102, 91),
            bottom: new TabBar(controller: controller, tabs: <Tab>[
              new Tab(
                text: 'Navigation',
              ),
              new Tab(
                text: 'Face Recognition',
              ),
              new Tab(
                text: 'Medical Check-Up',
              ),
              new Tab(
                text: 'Patient Health',
              ),
              new Tab(
                text: 'Administration',
              )
            ])),
        body: new TabBarView(controller: controller, children: <Widget>[
          new navigation.Navigation(),
          new facerecog.FaceRecognition(),
          new mcu.MyApp(),
          new patienthealth.PatientHealth(),
          new admin.Administration()
        ]));
  }
}
