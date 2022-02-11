
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> buttons = [
    "AC",
    "DLT",
    "%",
    "/",
    "9",
    "8",
    "7",
    "*",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "=",
  ];

  var userinput = "";
  var useroutput = "";

  void expressions() {
    Parser p = Parser();
    Expression exp = p.parse(userinput);
    ContextModel cm = ContextModel();
    var eval = exp.evaluate(EvaluationType.REAL, cm);
    useroutput = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userinput,
                      style: const TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ),
                  const Divider(
                    indent: 35,
                    endIndent: 35,
                    thickness: 3,
                    color: Colors.black,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(right: 35, top: 30, bottom: 30),
                    alignment: Alignment.centerRight,
                    child: Text(
                      useroutput,
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: 350,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: buttons.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return AllButtons(
                        onPressed: () {
                          setState(() {
                            userinput = "";
                          });
                        },
                        buttoncolor: Colors.greenAccent,
                        buttontext: buttons[index],
                        buttontextcolor: Colors.black,
                      );
                    } else if (index == 1) {
                      return AllButtons(
                        onPressed: () {
                          setState(() {
                            userinput =
                                userinput.substring(0, userinput.length - 1);
                          });
                        },
                        buttoncolor: Colors.red.shade800,
                        buttontext: buttons[index],
                        buttontextcolor: Colors.black,
                      );
                    } else if (index == buttons.length - 1) {
                      return AllButtons(
                        onPressed: () {
                          setState(() {
                            expressions();
                          });
                        },
                        buttoncolor: Colors.teal.shade100,
                        buttontext: buttons[index],
                        buttontextcolor: Colors.black,
                      );
                    } else {
                      return AllButtons(
                        onPressed: () {
                          setState(() {
                            userinput = userinput + buttons[index];
                          });
                        },
                        buttoncolor: isOperator(buttons[index])
                            ? Colors.orangeAccent
                            : Colors.blue.shade100,
                        buttontext: buttons[index],
                        buttontextcolor: Colors.black,
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == "%" || x == "+" || x == "-" || x == "*" || x == "/" || x == "=") {
      return true;
    }
    return false;
  }
}
