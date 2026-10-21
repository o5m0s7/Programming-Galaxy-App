import 'package:flutter/material.dart';
import 'home_Page.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  bool isDarkMode = true;

  final List<Map<String, String>> friends = [
    {
      "name": "Mohammed Ouais",
      "email": "awysm36@gmail.com",
      "specialty": "Flutter & Backend Developer",
    },
    {
      "name": "Mostafa Kamel",
      "email": "mostafakamel@gmail.com",
      "specialty": "Ai & python Developer",
    },
    {
      "name": "Mohammed Anwar",
      "email": "anwar@gmail.com",
      "specialty": "Full Stack Developer",
    },
    {
      "name": "Master Joe",
      "email": "joemohammed@gmail.com",
      "specialty": "Embedded System",
    },
    {
      "name": "Mohammed Omar",
      "email": "omarmoh@gmail.com",
      "specialty": "Senior Frontend Developer",
    },
    {
      "name": "Ouais Mohammed",
      "email": "mohammedouais@gmail.com",
      "specialty": "Cybersecurity Specialist",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[200],
      appBar: AppBar(
        title: Text("Friends",
          style: TextStyle(
              color: isDarkMode ? Colors.cyanAccent : Colors.blue, fontFamily: 'Pacifico',),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        actions: [
          Row(
            children: [
              Text(
                isDarkMode ? "Dark " : "Light ",
                style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black),
              ),
              Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
                activeColor: Colors.green,
                inactiveThumbColor: Colors.blue,
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: friends.length,
              itemBuilder: (context, index) {
                final friend = friends[index];
                return Card(
                  color: isDarkMode ? Colors.white10 : Colors.white,
                  margin:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    title: Text(
                      friend["name"]!,
                      style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(friend["email"]!,
                            style: TextStyle(
                                color:
                                isDarkMode ? Colors.grey : Colors.black54)),
                        Text(friend["specialty"]!,
                            style: TextStyle(
                                color:
                                isDarkMode ? Colors.green : Colors.blue)),
                      ],
                    ),
                    trailing: PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert,
                          color: isDarkMode ? Colors.white : Colors.black),
                      onSelected: (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('$value ${friend["name"]}')),
                        );
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: "Unfollow",
                          child: Text("Unfollow"),
                        ),
                        const PopupMenuItem(
                          value: "Chat",
                          child: Text("Chat"),
                        ),
                        const PopupMenuItem(
                          value: "View Profile",
                          child: Text("View Profile"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  isDarkMode ? Colors.cyan : Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  "Back to Home",
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
