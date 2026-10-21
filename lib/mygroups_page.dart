import 'package:flutter/material.dart';
import 'home_Page.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  bool isDarkMode = true;


  final List<Map<String, String>> groups = [
    {"name": "Group Flutter Developers", "members": "15 Members"},
    {"name": "Group JavaScript Masters","members": "20 Members"},
    {"name": "Group Python Experts",  "members": "12 Members"},
    {"name": "Group C# Coders", "members": "18 Members"},
    {"name": "Group UI/UX Designers", "members": "10 Members"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[200],
      appBar: AppBar(
        title: Text("Groups",
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
              itemCount: groups.length,
              itemBuilder: (context, index) {
                final group = groups[index];
                return Card(
                  color: isDarkMode ? Colors.white10 : Colors.white,
                  margin:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    title: Text(
                      group["name"]!,
                      style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(group["members"]!,
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
                          SnackBar(content: Text('$value ${group["name"]}')),
                        );
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: "Leave Group",
                          child: Text("Leave Group"),
                        ),
                        const PopupMenuItem(
                          value: "View Group",
                          child: Text("View Group"),
                        ),
                        const PopupMenuItem(
                          value: "Invite Members",
                          child: Text("Invite Members"),
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
