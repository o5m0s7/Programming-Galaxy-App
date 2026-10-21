import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  bool isDarkMode = false;

  String name = "No Name";
  String email = "No Email";
  int score = 0;

  List<Map<String, dynamic>> rankingData = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? "No Name";
    email = prefs.getString('email') ?? "No Email";
    score = prefs.getInt('score') ?? 0;

    _loadRankingData();
  }

  void _loadRankingData() {
    rankingData = [
      {"name": name, "email": email, "score": score},
      {"name": "Mohammed Omar", "email": "omarmoh@gmail.com", "score": 4},
      {"name": "Mohammed Anwar", "email": "anwar@gmail.com", "score": 5},
      {"name": "Mostafa Kamel", "email": "mostafakamel@gmail.com", "score": 1},
      {"name": "Ahmed", "email": "ahmed@gmail.com", "score": 3},
    ];

    rankingData.sort((a, b) => b['score'].compareTo(a['score']));

    setState(() {}); //  refersh
  }

  Color _getRankColor(int index) {
    if (index == 0) return Colors.amber;
    if (index == 1) return Colors.grey;
    if (index == 2) return const Color(0xFFCD7F32);
    return Colors.white24;
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.blue[900] : Colors.blue,
          centerTitle: true,
          title: Text(
            "Ranking",
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
          shadowColor: isDarkMode ? Colors.blue[900] : Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: rankingData.length,
                itemBuilder: (context, index) {
                  final player = rankingData[index];
                  return Card(
                    color: _getRankColor(index),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: _getRankColor(index),
                        width: 2,
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _getRankColor(index),
                        child: Text(
                          "${index + 1}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        player['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: textColor),
                      ),
                      subtitle: Text(
                        player['email'],
                        style: TextStyle(color: Colors.cyanAccent),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Rank ${index + 1}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: textColor),
                          ),
                          Text(
                            "Score: ${player['score']}",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                child: const Text("Home", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
