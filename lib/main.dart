import 'package:flutter/material.dart';
import 'package:flutter_setting_page_ui/SettingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'Setting UI',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {},
            ),
            Divider(height: 0, thickness: 1),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingScreen()),
                );
              },
            ),
            Divider(height: 0, thickness: 1),
            ListTile(
              title: Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
