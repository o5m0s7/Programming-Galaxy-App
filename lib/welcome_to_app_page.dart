import 'package:flutter/material.dart';

class Welcmetoapppage1 extends StatefulWidget {
  const Welcmetoapppage1({super.key});

  @override
  State<Welcmetoapppage1> createState() => _Welcmetoapppage1State();
}

class _Welcmetoapppage1State extends State<Welcmetoapppage1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Programming Galaxy",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Container(   // CircleAvatar
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white12, width: 5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.cyan,
                    blurRadius: 6,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/IMG-20250813-WA0007.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Center(
            child: Text(
              "Welcome Programmer!",
              style: TextStyle(
                color: Colors.green,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 20),
            child: Column(
              children: [

                // -------------- Start ----------------
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  color: Colors.blue,
                  height: 65,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.play_arrow, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Start",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // ------------------ Setting ----------------
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/setting');
                  },
                  color: Colors.red,
                  height: 65,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.settings, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Setting",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                // ------------------- About Us ------------------
                MaterialButton(
                  onPressed: () => showAboutDialogBox(context),
                  color: Colors.purple,
                  height: 65,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.help_outline, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "About Us",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.code_rounded, color: Colors.white),
                    Icon(Icons.r_mobiledata_outlined, color: Colors.white),
                    SizedBox(width: 2),
                    Text(
                      "Powered by Flutter",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showAboutDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("About Us"),
        content: const Text(
          "Programming Galaxy App\n\n"
              "Developed for programmers who love coding.\n"
              "This app includes tutorials, tools, and settings for customization.\n\n"
              "Version: 1.0.0\n"
              "© 2025 Programming Galaxy",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

}
