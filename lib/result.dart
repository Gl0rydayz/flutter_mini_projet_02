import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  late int firstNumber;
  late int secondNumber;
  late String operation;
  late String message;

  ResultScreen(int firstNumber, int secondNumber, String operation) {
    int? result;

    this.firstNumber = firstNumber;
    this.secondNumber = secondNumber;
    this.operation = operation;

    if (operation == "+") {
      result = firstNumber + secondNumber;
    } else if (operation == "-") {
      result = firstNumber - secondNumber;
    } else if (operation == "*") {
      result = firstNumber * secondNumber;
    }

    message = "$firstNumber $operation $secondNumber = $result";
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
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calculate_rounded,
                    size: 70,
                    color: Colors.red.shade500,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
