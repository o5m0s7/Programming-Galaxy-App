import 'package:flutter/material.dart';
import 'html_test_page.dart';
import 'css_test_page.dart';
import 'cpp_test_page.dart';
import 'csharp_test_page.dart';
import 'js_test_page.dart';
import 'flutter_test_page.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            icon: Icon(Icons.reset_tv,
                color: isDarkMode ? Colors.blue : Colors.orange),
          ),
          elevation: 18,
          shadowColor: Colors.cyanAccent,
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          centerTitle: true,
          title: Text( "Testing",
            style: TextStyle(
                color: isDarkMode ? Colors.cyanAccent : Colors.deepOrange),
          ),
          actions: [
            Switch(
              value: isDarkMode,
              activeColor: Colors.cyanAccent,
              inactiveThumbColor: Colors.orange,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 15.0,
              mainAxisExtent: 150.0,
            ),
            children: [
              subjectTile("HTML", const Color(0xFFE34F26),
                  const Color(0xFFA1371A), HtmlQuizPage()),
              subjectTile("C++", const Color(0xFF00599C),
                  const Color(0xFF003A66), CppQuizPage()),
              subjectTile("Css", const Color(0xFF3776AB),
                  const Color(0xFF1E4A77), CssQuizPage()),
              subjectTile("Js", const Color(0xFF04C4FF),
                  const Color(0xFF004B87), JavaScriptQuizPage()),
              subjectTile("Flutter", const Color(0xFF02569B),
                  const Color(0xFF013A6B), FlutterQuizPage()),
              subjectTile("C#", const Color(0xFF9B4F96),
                  const Color(0xFF6B3470), CSharpQuizPage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget subjectTile(
      String title, Color color, Color borderColor, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 3),
          boxShadow: const [
            BoxShadow(
              blurRadius: 6,
              color: Colors.blue,
              offset: Offset(2, 4),
            )
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
