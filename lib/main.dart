import 'package:flutter/material.dart';
import 'package:mypro3/home_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome_to_app_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'setting_page.dart';
import 'my_profaile.dart';
import 'search_page.dart';
import 'my_certificates_page.dart';
import 'my_course_page.dart';
import 'testing_page.dart';
import 'score_page.dart';
import 'ranking_page.dart';
import 'myfrinds_page.dart';
import 'mygroups_page.dart';
import 'my_courses_completed_page.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool isloggedIn = prefs.getBool('isloggedIn') ?? false;

  runApp(MyApp(isloggedIn: isloggedIn));
}

class MyApp extends StatefulWidget {
  final bool isloggedIn;

  const MyApp ({super.key, required this.isloggedIn});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Programming Galaxy',

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,

      // route
      initialRoute: widget.isloggedIn ?  '/home' : '/' ,
      routes: {
        '/'                : (context) => Welcmetoapppage1(),
        '/login'           : (context) => Loginpage2(),
        '/register'        : (context) => RegisterPage3(),
        '/home'            : (context) => HomePage(),
        '/setting'         : (context) => SettingsPage(),
        '/profile'         : (context) => MyProfaile(),
        '/search'          : (context) => MySearch(),
        '/Certificates'    : (context) => MyCertificates(),
        '/Courses'         : (context) => CoursesApp(),
        '/test'            : (context) => TestingPage(),
        '/Result'          : (context) => ResultPage(),
        '/Rank'            : (context) => RankingPage(),
        '/Friends'         : (context) => FriendsPage(),
        '/Group'           : (context) => GroupsPage(),
        '/CourseCompleted' : (context) => MyCoursesCompletedPageeteApp(),
      },
    );
  }
}

