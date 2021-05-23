import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_setting_page_ui/main.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool valueNotify1 = true;
  bool valueNotify2 = false;
  bool valueNotify3 = true;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valueNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valueNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      valueNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(height: 20, thickness: 1),
            SizedBox(height: 10),
            buildAccountOption(context, 'Change Password'),
            buildAccountOption(context, 'Content Settings'),
            buildAccountOption(context, 'Social'),
            buildAccountOption(context, 'Language'),
            buildAccountOption(context, 'Privacy and Security'),
            SizedBox(height: 40),
            Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: Colors.blue,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(height: 20, thickness: 1),
            SizedBox(height: 10),
            buildNotificationOption(
                'Theme Dark', valueNotify1, onChangeFunction1),
            buildNotificationOption(
                'Acount Activity', valueNotify2, onChangeFunction2),
            buildNotificationOption(
                'Opportunity', valueNotify3, onChangeFunction3),
            SizedBox(height: 50),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'SIGN OUT',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Sign Out'),
                          content: Text('Dou you want to Sign Out?'),
                          actions: [
                            TextButton(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: Text('Yes'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

GestureDetector buildAccountOption(BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Option1'),
                    Text('Option2'),
                  ]),
              actions: [
                TextButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}

Padding buildNotificationOption(
    String title, bool value, Function onChangeMethod) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            activeColor: Colors.blue,
            trackColor: Colors.grey,
            value: value,
            onChanged: (bool newValue) {
              onChangeMethod(newValue);
            },
          ),
        ),
      ],
    ),
  );
}
