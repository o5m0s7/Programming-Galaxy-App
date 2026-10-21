import 'package:flutter/material.dart';

class CoursesApp extends StatefulWidget {
  const CoursesApp({super.key});

  @override
  State<CoursesApp> createState() => _CoursesAppState();
}

class _CoursesAppState extends State<CoursesApp> {
  bool isDarkMode = true;
  int selectedIndex = 0;

  final List<Map<String, dynamic>> courses = [
    {
      "name": "Flutter",
      "image": "images/IMG-20250813-WA0010.jpg",
      "color": Colors.blue,
      "details":
      "Flutter is an open-source framework for building mobile, web, and desktop applications."
    },
    {
      "name": "C#",
      "image": "images/IMG-20250813-WA0004.jpg",
      "color": Colors.purple,
      "details":
      "C# is a powerful programming language by Microsoft used for Windows and web applications."
    },
    {
      "name": "C++",
      "image": "images/IMG-20250813-WA0003.jpg",
      "color": Colors.red,
      "details":
      "C++ is a high-performance programming language used in game development and high-processing applications."
    },
    {
      "name": "HTML",
      "image": "images/IMG-20250813-WA0006.jpg",
      "color": Colors.redAccent,
      "details": "HTML is a markup language used to build web pages."
    },
    {
      "name": "CSS",
      "image": "images/IMG-20250813-WA0008.jpg",
      "color": Colors.lightBlue,
      "details": "CSS is used to style web pages and add design elements."
    },
    {
      "name": "JavaScript",
      "image": "images/IMG-20250813-WA0005.jpg",
      "color": Colors.amber,
      "details": "JavaScript is a programming language used to make web pages interactive."
    },
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Courses"),
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
                }
                );
              },
            ),
          ],
        ),
        body: buildCoursesPage(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
            // navigateToPage(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "Courses",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.filter_list),
              label: "Filter",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }

  void showCourseDetails(String courseName, String details) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(courseName),
        content: Text(details),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
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
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
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
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    course["name"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: course["color"].shade700,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: course["color"]),
                      onPressed: () {},
                      child: const Text("Enrol"),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        showCourseDetails(course["name"], course["details"]);
                      },
                      child: const Text("Details"),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
              ],
            ),
          );
        },
      ),
    );
  }
}