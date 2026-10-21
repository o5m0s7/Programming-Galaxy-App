import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HtmlQuizPage extends StatefulWidget {
  const HtmlQuizPage({super.key});

  @override
  State<HtmlQuizPage> createState() => _HtmlQuizPageState();
}

class _HtmlQuizPageState extends State<HtmlQuizPage> {
  bool isDarkMode = false;
  bool isSubmitted = false;
  int correctCount = 0;

  // Correct answers index for each question
  final List<List<int>> correctMultiChoice = [
    [0, 1], // Q1
    [1],    // Q2
    [0, 2], // Q3
    [3]     // Q4
  ];
  final List<int> correctSingleChoice = [1, 2, 0];
  final List<int> correctTrueFalse = [0, 1, 0]; // 0=True, 1=False

  // User answers
  List<List<bool>> multiChoiceAnswers = List.generate(4, (_) => List.filled(4, false));
  List<int?> singleChoiceAnswers = List.filled(3, null);
  List<int?> trueFalseAnswers = List.filled(3, null);

  @override
  Widget build(BuildContext context) {
    final bgColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final cardColor = isDarkMode ? Colors.lightBlue : Colors.blue;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.cyan : Colors.blue,
          centerTitle: true,
          title: Text(
            "HTML Quiz",
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
          shadowColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Multiple Choice (Checkbox)
              _buildCheckboxQuestion(
                "1. Which tags are used for creating a list in HTML?",
                ["<ul>", "<ol>", "<li>", "<br>"],
                multiChoiceAnswers[0],
                correctMultiChoice[0],
                cardColor,
                textColor,
              ),
              _buildCheckboxQuestion(
                "2. Which HTML tag is used to insert an image?",
                ["<link>", "<img>", "<image>", "<src>"],
                multiChoiceAnswers[1],
                correctMultiChoice[1],
                cardColor,
                textColor,
              ),
              _buildCheckboxQuestion(
                "3. Which are HTML heading tags?",
                ["<h1>", "<head>", "<h3>", "<header>"],
                multiChoiceAnswers[2],
                correctMultiChoice[2],
                cardColor,
                textColor,
              ),
              _buildCheckboxQuestion(
                "4. Which tag is used to create a table row?",
                ["<td>", "<th>", "<table>", "<tr>"],
                multiChoiceAnswers[3],
                correctMultiChoice[3],
                cardColor,
                textColor,
              ),

              // Single Choice (Radio)
              _buildRadioQuestion(
                "5. Which HTML tag is used to make text bold?",
                ["<i>", "<b>", "<strong>", "<em>"],
                singleChoiceAnswers[0],
                    (value) => setState(() => singleChoiceAnswers[0] = value),
                correctSingleChoice[0],
                cardColor,
                textColor,
              ),
              _buildRadioQuestion(
                "6. What is the correct HTML element for the largest heading?",
                ["<heading>", "<h3>", "<h1>", "<h6>"],
                singleChoiceAnswers[1],
                    (value) => setState(() => singleChoiceAnswers[1] = value),
                correctSingleChoice[1],
                cardColor,
                textColor,
              ),
              _buildRadioQuestion(
                "7. Which HTML tag is used for inserting a line break?",
                ["<br>", "<lb>", "<break>", "<newline>"],
                singleChoiceAnswers[2],
                    (value) => setState(() => singleChoiceAnswers[2] = value),
                correctSingleChoice[2],
                cardColor,
                textColor,
              ),

              // True / False (Radio)
              _buildRadioQuestion(
                "8. HTML stands for Hyper Text Markup Language.",
                ["True", "False"],
                trueFalseAnswers[0],
                    (value) => setState(() => trueFalseAnswers[0] = value),
                correctTrueFalse[0],
                cardColor,
                textColor,
              ),
              _buildRadioQuestion(
                "9. <p> is used for creating paragraphs.",
                ["True", "False"],
                trueFalseAnswers[1],
                    (value) => setState(() => trueFalseAnswers[1] = value),
                correctTrueFalse[1],
                cardColor,
                textColor,
              ),
              _buildRadioQuestion(
                "10. <a> tag is used to insert an image.",
                ["True", "False"],
                trueFalseAnswers[2],
                    (value) => setState(() => trueFalseAnswers[2] = value),
                correctTrueFalse[2],
                cardColor,
                textColor,
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? Colors.cyan : Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _checkAnswers,
                    child: const Text("Submit", style: TextStyle(fontSize: 18)),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? Colors.cyan : Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/Result');
                    },
                    child: const Text("Go to Result", style: TextStyle(fontSize: 18)),
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

    // Check Multiple Choice
    for (int i = 0; i < multiChoiceAnswers.length; i++) {
      if (listEquals(multiChoiceAnswers[i], _getCorrectAnswerList(correctMultiChoice[i]))) {
        score++;
      }
    }

    // Check Single Choice
    for (int i = 0; i < singleChoiceAnswers.length; i++) {
      if (singleChoiceAnswers[i] == correctSingleChoice[i]) {
        score++;
      }
    }

    // Check True/False
    for (int i = 0; i < trueFalseAnswers.length; i++) {
      if (trueFalseAnswers[i] == correctTrueFalse[i]) {
        score++;
      }
    }

    // save data in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('score', score);
    await prefs.setInt('totalQuestions',
        multiChoiceAnswers.length + singleChoiceAnswers.length + trueFalseAnswers.length);

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

  Widget _buildCheckboxQuestion(String question, List<String> options, List<bool> answers,
      List<int> correctIndexes, Color cardColor, Color textColor) {
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
            const SizedBox(height: 6),
            for (int i = 0; i < options.length; i++)
              CheckboxListTile(
                activeColor: isDarkMode ? Colors.cyan : Colors.blue,
                title: Text(options[i], style: TextStyle(color: textColor)),
                value: answers[i],
                tileColor: isSubmitted ? (correctIndexes.contains(i) ? Colors.green
                    : (answers[i] ? Colors.red : null)) : null,
                onChanged: isSubmitted ? null : (value) {
                  setState(() {
                    answers[i] = value ?? false;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioQuestion(String question, List<String> options, int? selectedValue,
      Function(int?) onChanged, int correctIndex, Color cardColor, Color textColor) {
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
            const SizedBox(height: 6),
            for (int i = 0; i < options.length; i++)
              RadioListTile(
                activeColor: isDarkMode ? Colors.cyan : Colors.blue,
                title: Text(options[i], style: TextStyle(color: textColor)),
                value: i,
                groupValue: selectedValue,
                tileColor: isSubmitted ? (i == correctIndex ? Colors.green[900] : (selectedValue == i ? Colors.red[700] : null)) : null,
                onChanged: isSubmitted ? null : onChanged,
              ),
          ],
        ),
      ),
    );
  }
}
