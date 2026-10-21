import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  double soundLevel = 50;
  double brightnessLevel = 50;
  bool vibrationEnabled = true;
  bool darkMode = false;
  bool notificationsEnabled = true;
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 18,
        shadowColor: Colors.cyanAccent,
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        centerTitle: true,
        title: Text(
          "Setting",
          style: TextStyle(
              color: isDarkMode ? Colors.cyanAccent : Colors.blue),
        ),
      ),

      body: ListView(
        children: [
          // Level sound
          SizedBox(height: 10,),
          ListTile(
            title: const Text("Level sound"),
            subtitle: Slider(
              value: soundLevel,
              min: 0,
              max: 100,
              divisions: 100,
              label: "${soundLevel.round()}%",
              onChanged: (value) {
                setState(() {
                  soundLevel = value;
                });
              },
            ),
          ),

          // ------------- BrightnessLevel ------------
          ListTile(
            title: const Text("BrightnessLevel"),
            subtitle: Slider(
              value: brightnessLevel,
              min: 0,
              max: 100,
              divisions: 100,
              label: "${brightnessLevel.round()}%",
              onChanged: (value) {
                setState(() {
                  brightnessLevel = value;
                });
              },
            ),
          ),

          // ------------ Vibration ---------------
          SwitchListTile(
            title: const Text("Vibration"),
            value: vibrationEnabled,
            onChanged: (value) {
              setState(() {
                vibrationEnabled = value;
              });
            },
          ),

          // -------------- Dark Modeing -------------
          SwitchListTile(
            title: const Text("Dark Modeing"),
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
            },
          ),

          // ----------------- Notifications -------------
          SwitchListTile(
            title: const Text("Notifications"),
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),

          const SizedBox(height: 30),

          // ------------------ Buttons ---------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Saved Changed successfully ✅")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      "Save Chang",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      "Back",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
