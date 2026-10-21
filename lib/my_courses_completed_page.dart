import 'package:flutter/material.dart';


class MyCoursesCompletedPageeteApp extends StatefulWidget {
  const MyCoursesCompletedPageeteApp({super.key});

  @override
  State<MyCoursesCompletedPageeteApp> createState() => _MyCoursesCompletedPageeteAppState();
}

class _MyCoursesCompletedPageeteAppState extends State<MyCoursesCompletedPageeteApp> {
  bool isDarkMode = true;
  int selectedIndex = 0;

  final List<Map<String, dynamic>> courses = [
    {
      "name": "Flutter",
      "image": "images/IMG-20250813-WA0010.jpg",
      "color": Colors.blue,
      "complete": "Completed %100",
    },
    {
      "name": "C#",
      "image": "images/IMG-20250813-WA0004.jpg",
      "color": Colors.green,
      "complete": "Completed %34",
    },
    {
      "name": "C++",
      "image": "images/IMG-20250813-WA0003.jpg",
      "color": Colors.cyan,
      "complete": "Completed %90",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My Courses"),
          centerTitle: true,
          elevation: 4,
          shadowColor: Colors.blueAccent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
          ],
        ),
        body: buildCoursesPage(),
      ),
    );
  }

  Widget buildCoursesPage() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Container(
            decoration: BoxDecoration(
              color: course["color"].withOpacity(0.15),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: course["color"], width: 2),
              boxShadow: [
                BoxShadow(
                  color: course["color"].withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          course["image"],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Icon(
                        Icons.play_circle_fill,
                        size: 50,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        course["name"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: course["color"].shade700,
                        ),
                      ),
                      Text(
                        course["complete"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: course["color"].shade700,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: course["color"]),
                      onPressed: () {},
                      child: const Text("Continue"),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
              ],
            ),
          );
        },
      ),
    );
  }
}
