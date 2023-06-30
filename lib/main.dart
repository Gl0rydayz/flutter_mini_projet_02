import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mini_Projet_02"),
          backgroundColor: Colors.red.shade500,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.red.shade200,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 13, 8, 13),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        "Hi",
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "IOUIRY Oussama",
                        style: TextStyle(
                          fontSize: 19,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Icon(Icons.info),
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Go"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
