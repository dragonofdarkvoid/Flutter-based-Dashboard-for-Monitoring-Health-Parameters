import 'package:flutter/material.dart';

class FaceRecognition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              radius: 180,
              backgroundColor: Color.fromARGB(255, 1, 78, 88),
              child: CircleAvatar(
                radius: 170,
                backgroundColor: Color.fromARGB(255, 11, 26, 53),
                child: CircleAvatar(
                  radius: 165,
                  child: Image.asset('images/SAMRI.png'),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          "FACE RECOGNITION",
          style: TextStyle(fontSize: 35, color: Colors.white),
        )
      ],
    );
  }
}
