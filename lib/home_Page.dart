import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'search_page.dart';
import 'my_course_page.dart';
import 'testing_page.dart';
import 'score_page.dart';
import 'ranking_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkMode = true;

  String? saveNameDrwor;
  String? saveemailDrowor;
  String? saveimageDrowor;

   final TextEditingController emailController = TextEditingController();
   final TextEditingController nameController = TextEditingController();
   final TextEditingController imageCotroller = TextEditingController();

    @override
    void initState(){
      super.initState();
      _loadUserData();
    }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      saveNameDrwor = prefs.getString('name') ?? "No Name";
      saveemailDrowor = prefs.getString('email') ?? "No Email";
      saveimageDrowor = prefs.getString('image') ?? " ";
    });
  }

  // Lists Posts
  final List<Map<String, String>> posts = [
    {
      'name': 'Mohammed Ouais',
      'date': '6h ϙ',
      'text': 'Learning Flutter is fun and powerful for cross-platform apps!',
    },
    {
      'name': 'Mostafa',
      'date': '7 days',
      'text': 'Dart makes UI building much easier and cleaner.',
    },
    {
      'name': 'Ouais Mohammed',
      'date': '2 month',
      'text': 'State management in Flutter can be simple if you start with Provider.',
    },
    {
      'name': 'Mohammed Ouais',
      'date': '2025-08-08',
      'text': 'Material Design helps your app look consistent and professional.',
    },
    {
      'name': '"M.|\'|.H" 3>!',
      'date': '2025-08-07',
      'text': 'Animations in Flutter make the user experience smooth and engaging.',
    },
    {
      'name': 'Unknown!',
      'date': '2025-08-13',
      'text': 'The Flutter is difficult and tired.',
    },
    {
      'name': 'Mohammed Omar',
      'date': '2w ϙ',
      'text': 'Learning Flutter is fun and powerful for cross-platform apps!',
    },
    {
      'name': 'Mohammed Anwar',
      'date': '45m ϙ',
      'text': 'Learning Flutter is fun and powerful for cross-platform apps!',
    },
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: isDarkMode ? Colors.black : Colors.white24,
            title: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MySearch()),
                    );
                  },
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MySearch()),
                      );
                    },
                    child: Container(
                      height: 35,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Search..."),
                      ),
                    ),
                  ),
                ),
              ],
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
            bottom: TabBar(
              onTap: (index) {
                if (index == 1) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CoursesApp()),);
                }
                else if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TestingPage()),
                  );
                }
                else if (index == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ResultPage()),
                  );
                }
                else if (index == 4) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RankingPage()),
                  );
                }
              },

              tabs: [
                Tab(icon: Icon(Icons.cottage_rounded), text: "Home" ),
                Tab(icon: Icon(Icons.video_label_outlined), text: ' Courses'),
                Tab(icon: Icon(Icons.text_snippet_outlined), text: ' Tests'),
                Tab(icon: Icon(Icons.score), text: ' Score'),
                Tab(icon: Icon(Icons.sort_rounded), text: ' Ranking'),
              ],
            ),
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              },
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: isDarkMode ? Colors.cyanAccent : Colors.green),
                  accountName: Text(saveNameDrwor ?? "" , style: TextStyle( color: isDarkMode ? Colors.black : Colors.cyan, fontFamily: 'Pacifico',), ),
                  accountEmail: Text(saveemailDrowor ?? "", style: TextStyle( color: isDarkMode ? Colors.black : Colors.cyan, fontFamily: 'Pacifico',),),
                  currentAccountPicture: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('images/Ouais1.jpg'),
                  ),
                  otherAccountsPictures: [
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                      onSelected: (value) {
                        if (value == "new_account") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterPage3()),
                          );
                        } else if (value == "logout") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const Loginpage2()),
                          );
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: "new_account",
                          child: Row(
                            children: [
                              Icon(Icons.person_add),
                              SizedBox(width: 8),
                              Text("Create New Account"),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: "logout",
                          child: Row(
                            children: [
                              Icon(Icons.logout),
                              SizedBox(width: 8),
                              Text("Logout"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("My Profile"),
                  onTap: () {
                    Navigator.of(context).pushNamed('/profile');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.card_membership),
                  title: const Text("My Certificates"),
                  onTap: () {
                    Navigator.of(context).pushNamed('/Certificates');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.video_library),
                  title: const Text("My Courses"),
                  onTap: () {
                    Navigator.of(context).pushNamed('/CourseCompleted');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.group),
                  title: const Text("My Groups"),
                  onTap: () {
                    Navigator.of(context).pushNamed('/Group');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text("My Friends"),
                  onTap: () {
                    Navigator.of(context).pushNamed('/Friends');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {
                    Navigator.of(context).pushNamed('/setting');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text("About Us"),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("About This App",
                          style: TextStyle( color: isDarkMode ? Colors.cyanAccent : Colors.blue,
                          fontSize: 16, fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico',
                          ),
                        ),
                        content: const Text(
                            "This application is a Flutter-based social and learning platform where users can share posts, join courses, take tests, and connect with friends."),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Close"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // View Posts
          body: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return PostCard(
                name: post['name']!,
                date: post['date']!,
                text: post['text']!,
              );
            },
          ),

          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.post_add),
                        title: const Text("Add Post"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.image),
                        title: const Text("My Posts"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.article),
                        title: const Text("Add Image"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.poll),
                        title: const Text("Create Poll"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.upload_file),
                        title: const Text("Upload file"),
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final String name;
  final String date;
  final String text;

  const PostCard({super.key, required this.name, required this.date, required this.text,});
  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;
  bool disliked = false;

  void toggleLike() {
    setState(() {
      liked = !liked;
      if (liked) disliked = false;
    });
  }

  void toggleDislike() {
    setState(() {
      disliked = !disliked;
      if (disliked) liked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------- Header Row ------------
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('ouais222.jpg'),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.date,
                        style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                const Spacer(),
                PopupMenuButton<String>(
                  onSelected: (value) {},
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                        value: "Save",
                        child: Row(children: [
                          Icon(Icons.save),
                          SizedBox(width: 5),
                          Text("Save")
                        ])),
                    const PopupMenuItem(
                        value: "Delete",
                        child: Row(children: [
                          Icon(Icons.delete),
                          SizedBox(width: 5),
                          Text("Delete")
                        ])),
                    const PopupMenuItem(
                        value: "Pin",
                        child: Row(children: [
                          Icon(Icons.push_pin),
                          SizedBox(width: 5),
                          Text("Pin")
                        ])),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(widget.text),
            const SizedBox(height: 10),
            // --------------- Buttons Row ---------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: toggleDislike,
                  child: Row(
                    children: [
                      Icon(Icons.thumb_down_alt_outlined,
                          color: disliked ? Colors.red : null),
                      const SizedBox(width: 5),
                      Text("Dislike", style: TextStyle(color: disliked ? Colors.red : null)),
                    ],
                  ),
                ),
                Row(children: const [
                  Icon(Icons.comment_outlined),
                  SizedBox(width: 5),
                  Text("Comment")
                ]),
                GestureDetector(
                  onTap: toggleLike,
                  child: Row(
                    children: [
                      Icon(Icons.thumb_up_alt_rounded, color: liked ? Colors.blue : null),
                      const SizedBox(width: 5),
                      Text("Like", style: TextStyle(color: liked ? Colors.blue : null)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}