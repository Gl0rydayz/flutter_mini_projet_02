import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({super.key});

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  String selectedOperation = "";

  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "First Number",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black,
                      ))),
                ),
                SizedBox(
                  height: 15,
                ),
                //region Radio Buttons
                ListTile(
                  title: const Text('+'),
                  leading: Radio(
                    value: "+",
                    groupValue: selectedOperation,
                    onChanged: (value) {
                      setState(() {
                        selectedOperation = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('-'),
                  leading: Radio(
                    value: "-",
                    groupValue: selectedOperation,
                    onChanged: (value) {
                        setState(() {
                          selectedOperation = value.toString();
                        });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('*'),
                  leading: Radio(
                    value: "*",
                    groupValue: selectedOperation,
                    onChanged: (value) {
                        setState(() {
                          selectedOperation = value.toString();
                        });
                    },
                  ),
                ),
                //endregion
                const TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "Second Number",
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Calculate"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
