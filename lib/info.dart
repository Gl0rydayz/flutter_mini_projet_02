import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> infos = [
      "About: Perform some basic arithmetic operations",
      "Year: 2023",
      "Developer: Oussama IOUIRY",
      "Email: iouiryoussama@gmail.com",
      "Phone: (+212)6 85 96 32 14"
    ];

    return Scaffold(
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
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: infos.length,
              itemBuilder: (context, position) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        border: Border(
                          left: BorderSide(
                            color: Colors.red.shade500,
                            width: 5,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(infos[position]),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
