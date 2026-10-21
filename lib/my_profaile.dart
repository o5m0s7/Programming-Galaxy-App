import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfaile extends StatefulWidget {
  const MyProfaile({super.key});

  @override
  State<MyProfaile> createState() => _MyProfaileState();
}

class _MyProfaileState extends State<MyProfaile> {
  bool isDarkMode = true;

  String? saveemailpro ;
  String? savepasswordpro ;
  String? saveNamepro ;
  String? savespecialtypro ;
  String? savephonepro ;
  String? savelocationpro ;
  String? saveagepro ;
  String? savenationalitypro ;
  String? savestatuspro ;
  String? savehobbiespro ;


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

  @override
  void initState(){
    super.initState();
    _loadUserDatapro();
  }

  Future<void> _loadUserDatapro() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      saveemailpro = prefs.getString('email') ?? "No Email";
      savepasswordpro = prefs.getString('password') ?? "No Pass";
      saveNamepro = prefs.getString('name') ?? "No Name";
      savespecialtypro = prefs.getString('specialty') ?? "No specialty";
      savephonepro = prefs.getString('phone') ?? "No phone";
      savelocationpro = prefs.getString('location') ?? "No location";
      saveagepro = prefs.getString('age') ?? "No age";
      savenationalitypro = prefs.getString('nationality') ?? "No nationality";
      savestatuspro = prefs.getString('status') ?? "No status";
      savehobbiespro = prefs.getString('hobbies') ?? "No hobbies";

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //---------------- if isDarkMode True ------------------
      theme: isDarkMode ? ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      )
      // -------------- if isDarkMode False ------------------
      : ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[200],
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      ),
      home: Scaffold(
        body: Column(
          children: [

            // ======= Header with Dark Mode Toggle =======
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('images/Ouais1.jpg'),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('My Profile',
                      style: TextStyle(
                        color: isDarkMode ? Colors.cyanAccent : Colors.blue,
                        fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Pacifico',
                      ),
                    ),
                  ),
                  SizedBox(width: 250,),
                  Switch(
                    value: isDarkMode, onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                    activeColor: Colors.blue,
                  ),
                ],
              ),
            ),

            // ======= Divider =======
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Divider(
                color: isDarkMode ? Colors.lightBlueAccent : Colors.cyan,
                thickness: 1.5,
              ),
            ),

            // ======= Profile Image =======
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white12 , width: 5),
                boxShadow: [
                  BoxShadow(
                    color: isDarkMode ?  Colors.cyan : Colors.blue ,
                    blurRadius: 6,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/Ouais1.jpg'),
              ),
            ),
            // Spacer(flex: 1,),

            // ======= Name =======
            Text(
              saveNamepro ?? ' ',
              style: TextStyle(
                color: isDarkMode ? Colors.green : Colors.blue,
                fontSize: 26,
                fontFamily: 'Pacifico',
              ),
            ),

            // ======= Job =======
            Text(savespecialtypro ?? ' ',
              style: TextStyle(
                color: isDarkMode ? Colors.cyanAccent : Colors.blue,
                fontSize: 16, fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),

            SizedBox(height: 10),

            // ======= Contact Info =======
            // ------- phone -------------
            Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.white24 : Colors.black12,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 30,
                width: 280,
                child: Row(
                  children: [
                    Spacer(flex: 1,),
                    Icon(Icons.phone, size: 23, color: isDarkMode ? Colors.cyanAccent : Colors.blue, ),
                    Spacer(flex: 1,),
                    Text(savephonepro ?? ' ', style: TextStyle(fontSize: 18), ),
                    Spacer(flex: 3,),
                  ],
                ),
              ),
            ),
            // ---------- e-mail ------------
            Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.white24 : Colors.black12,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 30,
                width: 280,
                child: Row(
                  children: [
                    Spacer(flex: 1,),
                    Icon(Icons.email, size: 23, color: isDarkMode ? Colors.cyanAccent : Colors.blue, ),
                    Spacer(flex: 1,),
                    Text(saveemailpro ?? ' ', style: TextStyle(fontSize: 18), ),
                    Spacer(flex: 3,),
                  ],
                ),
              ),
            ),
            // --------- place -------------
            Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.white24 : Colors.black12,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 30,
                width: 280,
                child: Row(
                  children: [
                    Spacer(flex: 1,),
                    Icon(Icons.place, size: 23, color: isDarkMode ? Colors.cyanAccent : Colors.blue, ),
                    Spacer(flex: 1,),
                    Text( savelocationpro ?? '', style: TextStyle(fontSize: 18), ),
                    Spacer(flex: 3,),
                  ],
                ),
              ),
            ),
            // ======= Divider =======
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Divider(
                color: isDarkMode ? Colors.lightBlueAccent : Colors.blue,
                thickness: 1.5,
              ),
            ),

            // ======= Personal Information Title =======
            Text( " Personal Information ",
              style: TextStyle(
                color: isDarkMode ? Colors.greenAccent : Colors.blue[900],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            // ======= Personal Info Details =======
            personalInfoRow("Age", saveagepro ?? " "),
            personalInfoRow("Nationality", savenationalitypro ?? " "),
            personalInfoRow("Marital Status", savestatuspro ??  ""),
            personalInfoRow("Hobbies", savehobbiespro ?? ' '),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  //--------------- Personal Info -------------
  Widget personalInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Text(
        "$label: $value",
        style: TextStyle(
            color: isDarkMode ? Colors.indigoAccent : Colors.blue,
            fontSize: 14),
      ),
    );
  }
}
