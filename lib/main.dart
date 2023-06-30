import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_m_p_02/info.dart';

import 'calculation.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String userName = faker.person.name();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                  Row(
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
                        userName,
                        style: TextStyle(
                          fontSize: 19,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => InfoScreen())
                            );
                          },
                          child: Icon(
                            Icons.info,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CalculationScreen()));
                    },
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
