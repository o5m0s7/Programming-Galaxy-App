import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CppQuizPage extends StatefulWidget {
  const CppQuizPage({super.key});

  @override
  State<CppQuizPage> createState() => _CppQuizPageState();
}

class _CppQuizPageState extends State<CppQuizPage> {
  bool isDarkMode = false;
  bool isSubmitted = false;
  int correctCount = 0;

  final List<List<int>> correctMultiChoice = [
    [0, 2], // Q1
    [1, 3], // Q2
    [0, 1], // Q3
    [2]     // Q4
  ];
  final List<int> correctSingleChoice = [2, 0, 1];
  final List<int> correctTrueFalse = [0, 1, 0];

  List<List<bool>> multiChoiceAnswers = List.generate(4, (_) => List.filled(4, false));
  List<int?> singleChoiceAnswers = List.filled(3, null);
  List<int?> trueFalseAnswers = List.filled(3, null);

  @override
  Widget build(BuildContext context) {
    final bgColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final cardColor = isDarkMode ? Colors.lightBlue : Colors.orange;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.orange[900] : Colors.orange,
          centerTitle: true,
          title: Text(
            "C++ Quiz",
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: textColor),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            Switch(
              value: isDarkMode,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
          ],
          elevation: 8,
          shadowColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              _buildCheckboxQuestion("1. Which are valid C++ data types?",
                  ["int", "float64", "double", "char"], multiChoiceAnswers[0], correctMultiChoice[0], cardColor, textColor),
              _buildCheckboxQuestion("2. Which of these are loops in C++?",
                  ["if", "for", "switch", "while"], multiChoiceAnswers[1], correctMultiChoice[1], cardColor, textColor),
              _buildCheckboxQuestion("3. Which are access specifiers in C++?",
                  ["public", "private", "get", "return"], multiChoiceAnswers[2], correctMultiChoice[2], cardColor, textColor),
              _buildCheckboxQuestion("4. Which operator is used to allocate memory dynamically?",
                  ["new[]", "malloc", "new", "allocate"], multiChoiceAnswers[3], correctMultiChoice[3], cardColor, textColor),

              _buildRadioQuestion("5. Which symbol is used for single-line comments in C++?",
                  ["/*", "//", "#", "<!--"], singleChoiceAnswers[0], (value) => setState(() => singleChoiceAnswers[0] = value), correctSingleChoice[0], cardColor, textColor),
              _buildRadioQuestion("6. Which header is needed for 'cout'?",
                  ["<iostream>", "<stdio.h>", "<string>", "<output>"], singleChoiceAnswers[1], (value) => setState(() => singleChoiceAnswers[1] = value), correctSingleChoice[1], cardColor, textColor),
              _buildRadioQuestion("7. Which keyword is used to create a class in C++?",
                  ["class", "struct", "object", "define"], singleChoiceAnswers[2], (value) => setState(() => singleChoiceAnswers[2] = value), correctSingleChoice[2], cardColor, textColor),

              _buildRadioQuestion("8. C++ is an object-oriented programming language.",
                  ["True", "False"], trueFalseAnswers[0], (value) => setState(() => trueFalseAnswers[0] = value), correctTrueFalse[0], cardColor, textColor),
              _buildRadioQuestion("9. In C++, 'main' function must always return an int.",
                  ["True", "False"], trueFalseAnswers[1], (value) => setState(() => trueFalseAnswers[1] = value), correctTrueFalse[1], cardColor, textColor),
              _buildRadioQuestion("10. 'cin' is used for output in C++.",
                  ["True", "False"], trueFalseAnswers[2], (value) => setState(() => trueFalseAnswers[2] = value), correctTrueFalse[2], cardColor, textColor),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    onPressed: _checkAnswers,
                    child: const Text("Submit"),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => Navigator.of(context).pushNamed('/Result'),
                    child: const Text("Go to Result"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkAnswers() async {
    int score = 0;

    for (int i = 0; i < multiChoiceAnswers.length; i++) {
      if (listEquals(multiChoiceAnswers[i], _getCorrectAnswerList(correctMultiChoice[i]))) {
        score++;
      }
    }
    for (int i = 0; i < singleChoiceAnswers.length; i++) {
      if (singleChoiceAnswers[i] == correctSingleChoice[i]) {
        score++;
      }
    }
    for (int i = 0; i < trueFalseAnswers.length; i++) {
      if (trueFalseAnswers[i] == correctTrueFalse[i]) {
        score++;
      }
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('score', score);
    await prefs.setInt('totalQuestions', multiChoiceAnswers.length + singleChoiceAnswers.length + trueFalseAnswers.length);

    setState(() {
      correctCount = score;
      isSubmitted = true;
    });
  }

  List<bool> _getCorrectAnswerList(List<int> correctIndexes) {
    List<bool> correctList = List.filled(4, false);
    for (var idx in correctIndexes) {
      correctList[idx] = true;
    }
    return correctList;
  }

  Widget _buildCheckboxQuestion(String question, List<String> options, List<bool> answers, List<int> correctIndexes, Color cardColor, Color textColor) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(question, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
            for (int i = 0; i < options.length; i++)
              CheckboxListTile(
                value: answers[i],
                onChanged: isSubmitted ? null : (value) => setState(() => answers[i] = value ?? false),
                title: Text(options[i], style: TextStyle(color: textColor)),
                tileColor: isSubmitted ? (correctIndexes.contains(i) ? Colors.green : (answers[i] ? Colors.red : null)) : null,
              )
          ],
        ),
      ),
    );
  }

  Widget _buildRadioQuestion(String question, List<String> options, int? selectedValue, Function(int?) onChanged, int correctIndex, Color cardColor, Color textColor) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(question, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
            for (int i = 0; i < options.length; i++)
              RadioListTile(
                value: i,
                groupValue: selectedValue,
                onChanged: isSubmitted ? null : onChanged,
                title: Text(options[i], style: TextStyle(color: textColor)),
                tileColor: isSubmitted ? (i == correctIndex ? Colors.green : (selectedValue == i ? Colors.red : null)) : null,
              )
          ],
        ),
      ),
    );
  }
}
