import 'package:flutter/material.dart';
import 'package:flutter_m_p_02/result.dart';

import 'database_helper.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({super.key});

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  String selectedOperation = "+";
  TextEditingController numberController01 = TextEditingController();
  TextEditingController numberController02 = TextEditingController();
  List<String> operationSymbols = [];

  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    loadSymbols();
    addSymbol("+");
    addSymbol("-");
    addSymbol("*");
    addSymbol("/");
    deleteSymbol("%");
  }

  Future<void> loadSymbols() async {
    final List<String> symbols = await databaseHelper.getSymbolsFromDb();
    setState(() {
      operationSymbols = symbols;
    });
  }

  Future<void> addSymbol(String symbol) async {
    await databaseHelper.insertSymbol(symbol);
    await loadSymbols();
  }

  Future<void> deleteSymbol(String symbol) async {
    await databaseHelper.deleteSymbol(symbol);
    await loadSymbols();
  }

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
                Column(
                  children: [
                    for (String symbol in operationSymbols)
                      ListTile(
                        title: Text(symbol),
                        leading: Radio(
                          value: symbol,
                          groupValue: selectedOperation,
                          onChanged: (value) {
                            setState(() {
                              selectedOperation = value.toString();
                            });
                          },
                        ),
                      ),
                  ],
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

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ResultScreen(
                              firstNumber, secondNumber, selectedOperation)));
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
