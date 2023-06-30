import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({super.key});

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  String selectedOperation = "+";
  TextEditingController numberController01 = TextEditingController();
  TextEditingController numberController02 = TextEditingController();

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
                TextField(
                  controller: numberController01,
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

                TextField(
                  controller: numberController02,
                  decoration: InputDecoration.collapsed(
                    hintText: "Second Number",
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    try {
                      int firstNumber = int.parse(numberController01.text);
                      int secondNumber = int.parse(numberController02.text);
                    } on Exception {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.blue.shade50,
                          title: const Text("Caution"),
                          content: const Row(
                            children: [
                              Icon(
                                Icons.info,
                                color: Colors.black,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Youd should enter Integers !!!")
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Understood'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text("Calculate"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
