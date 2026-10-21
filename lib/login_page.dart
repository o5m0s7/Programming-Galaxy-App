import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage2 extends StatefulWidget {
  const Loginpage2({super.key});

  @override
  State<Loginpage2> createState() => _Loginpage2State();
}

class _Loginpage2State extends State<Loginpage2> {
  bool isDarkMode = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPasswoed = prefs.getString('password');

    if( emailController.text == savedEmail && passwordController.text == savedPasswoed ){
        await prefs.setBool('isloggedIn', true);
        Navigator.pushReplacementNamed(context, '/home');
    } else {
        ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text("Invalid email or passwoed!"),),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            print("You are in Page Profile");
          },
          icon: Icon(Icons.pages_outlined,
              color: isDarkMode ? Colors.green : Colors.blue),
        ),
        elevation: 18,
        shadowColor: Colors.cyanAccent,
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(
              color: isDarkMode ? Colors.cyanAccent : Colors.blue),
        ),
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
                activeTrackColor: Colors.black,
                inactiveThumbColor: Colors.blue,
                inactiveTrackColor: Colors.cyanAccent,
              ),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "LOG IN:",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),

          const SizedBox(height: 20),

          userInputField(Icons.email, "Email", emailController),
          userInputField(Icons.password, "Password", passwordController),

          const SizedBox(height: 10),

          SizedBox(
            width: 350,
            height: 50,
            child: ElevatedButton(
              onPressed: () => login(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? Colors.cyan : Colors.deepPurple,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    "Login ",
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black),
                  ),
                  const Icon(Icons.login, color: Colors.white),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Forgot your password or email?",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white10 : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context,'/register');
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: isDarkMode ? Colors.cyan : Colors.blue,
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 16),
                    ),
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

  Widget userInputField( IconData icon, String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: 350,
        height: 50,
        child: TextField(
          obscureText: false,
          controller: controller,
          style:
          TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          decoration: InputDecoration(
            labelText: label,
            prefixIcon:
            Icon(icon, color: isDarkMode ? Colors.green : Colors.blue),
            filled: true,
            fillColor: isDarkMode ? Colors.white24 : Colors.grey[300],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
