import 'package:flutter/material.dart';

class MyCertificates extends StatefulWidget {
  const MyCertificates({super.key});

  @override
  State<MyCertificates> createState() => _MyCertificatesState();
}

class _MyCertificatesState extends State<MyCertificates> {
  bool isDarkMode = true;

  List<String> imagename = [
    "images/cybrary-cert-linux-cli-basics.pdf and 23 more pages - Personal - Microsoft​ Edge 8_8_2024 11_32_58 AM (4).png",
    "images/download_Python.png",
    "images/Mohammed Ouais Mohammed - Data Cleaning.png",
    "images/Mohammed Ouais Mohammed - Data Visualization.png",
    "images/ce(9)r.jpeg",
    "images/cer(1).jpeg",
    "images/cer(4).jpeg",
    "images/cer (2).jpeg",
    "images/cer(3).jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          elevation: 6,
          shadowColor: Colors.deepPurple,
        ),
      )
          : ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          elevation: 6,
          shadowColor: Colors.deepPurple,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("My Certificates",
            style: TextStyle(color: isDarkMode ? Colors.cyanAccent : Colors.blue,
            fontSize: 16, fontWeight: FontWeight.bold,
            fontFamily: 'Pacifico',
            ),
          ),
          centerTitle: true,
          actions: [
            Switch(
              value: isDarkMode,
              onChanged: (val) {
                setState(() {
                  isDarkMode = val;
                });
              },
            ),
          ],
        ),

        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: PageView.builder(
                  itemCount: imagename.length,
                  itemBuilder: (context, i) {
                    return Image.asset(
                      imagename[i],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (BuildContext context) {
                return SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.add),
                        title: const Text("Add New Certificate"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.delete),
                        title: const Text("Delete Certificate"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.download),
                        title: const Text("Download Certificate"),
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.menu),
        ),
      ),
    );
  }
}
