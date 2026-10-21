import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage3 extends StatefulWidget {
  const RegisterPage3({super.key});

  @override
  State<RegisterPage3> createState() => _RegisterPage3State();
}
class _RegisterPage3State extends State<RegisterPage3> {
  bool isDarkMode = true;
  String gender = "";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController specialtyController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController hobbiesController = TextEditingController();

  Future<void> saveUser(String email, String password, String name, String specialty, String phone,
      String location, String age,

      String nationality, String status, String hobbies ) async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email);
        await prefs.setString('password', password);
        await prefs.setString('name', name);
        await prefs.setString('specialty', specialty);
        await prefs.setString('phone', phone);
        await prefs.setString('location', location);
        await prefs.setString('age', age);
        await prefs.setString('nationality', nationality);
        await prefs.setString('status', status);
        await prefs.setString('hobbies', hobbies);
      }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: isDarkMode ? Colors.black : Colors.grey[200],
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.pages_outlined,
                color: isDarkMode ? Colors.green : Colors.blue),
          ),
          elevation: 18,
          shadowColor: Colors.cyanAccent,
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          centerTitle: true,
          title: Text(
            "Register",
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Sign In:",
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
              userInputField(Icons.person, "Name", nameController),
              userInputField(Icons.work, "Specialty", specialtyController),
              userInputField(Icons.phone, "Phone", phoneController),
              userInputField(Icons.place, "Location", locationController),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 10),
                child: Divider(
                  color: Colors.lightBlueAccent,
                  thickness: 1.5,
                ),
              ),
              const Center(
                child: Text(
                  "Personal Information",
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),
               Center(
                child: Text(
                  "What ia Your Gender?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.cyanAccent : Colors.black ,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: "Male",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                      const Icon(Icons.male, color: Colors.blue),
                      const SizedBox(width: 5),
                      Text("Male", style: TextStyle( color: isDarkMode ? Colors.lightBlue : Colors.black ),),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Row(
                    children: [
                      Radio(
                        value: "Female",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                      const Icon(Icons.female, color: Colors.pink),
                      const SizedBox(width: 5),
                      Text("Female", style: TextStyle( color: isDarkMode ? Colors.pinkAccent : Colors.black ),),
                    ],
                  ),
                ],
              ),

              userInputField(Icons.cake, "Age", ageController),
              userInputField(Icons.flag, "Nationality", nationalityController),
              userInputField(Icons.people, "Marital Status", statusController),
              userInputField(Icons.sports_esports, "Hobbies", hobbiesController),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty &&
                            nameController.text.isNotEmpty && specialtyController.text.isNotEmpty &&
                            phoneController.text.isNotEmpty && locationController.text.isNotEmpty &&
                            ageController.text.isNotEmpty && nationalityController.text.isNotEmpty &&
                            statusController.text.isNotEmpty && hobbiesController.text.isNotEmpty) {
                          await saveUser(
                            emailController.text, passwordController.text, nameController.text,
                            specialtyController.text, phoneController.text, locationController.text,
                            ageController.text, nationalityController.text, statusController.text, hobbiesController.text,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Account Create successfully.")),
                          );
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        backgroundColor: isDarkMode ? Colors.cyan : Colors.deepPurple,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.login, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
  }

  Widget userInputField(
      IconData icon, String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: 350,
        height: 50,
        child: TextField(
          controller: controller,
          style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black),
          decoration: InputDecoration(
            labelText: label,
            prefixIcon:
            Icon(icon, color: isDarkMode ? Colors.green : Colors.blue),
            filled: true,
            fillColor:
            isDarkMode ? Colors.white24 : Colors.grey[300],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
