import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> buttons = [
    'C', 'DEL', '%', '/',
    '1', '2', '3', '+',
    '4', '5', '6', '-',
    '7', '8', '9', '*',
    '.', '0', 'ANS', '=',
  ];

  String input = '';
  String output = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    input,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    output,
                    style: const TextStyle(color: Colors.white, fontSize: 48),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child:  Container  (
              child: Center(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: buttons.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GridButton(
                      buttonText: buttons[index],
                      onTap: () => handleButtonPress(buttons[index]),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleButtonPress(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        input = '';
        output = '';
      } else if (buttonText == 'DEL') {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else if (buttonText == '=') {
        try {
          output = calculate(input);
        } catch (e) {
          output = 'Error';
        }
      } else if (buttonText == 'ANS') {
        input += output;
      } else {
        input += buttonText;
      }
    });
  }

  String calculate(String input) {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(input.replaceAll('ANS', output));
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      return eval.toString();
    } catch (e) {
      return 'Error';
    }
  }
}

class GridButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  GridButton({required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color getButtonColor() {
      if (buttonText == 'C') return Colors.amber;
      if (buttonText == 'DEL') return Colors.red;
      if ('%/*-+'.contains(buttonText)) return Colors.blue;
      if (buttonText == '=') return Colors.green;
      if ('0123456789.'.contains(buttonText)) return Colors.orange;
      if(buttonText == 'ANS' ) return Colors.indigo;
      return Colors.white;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: getButtonColor(),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
