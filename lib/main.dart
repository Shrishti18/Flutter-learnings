import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thinking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => SplashPage(),
        '/first': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
      },
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String value;
  String value2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('HOME PAGE'),
          backgroundColor: Colors.cyan,
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  autofocus: false,
                  selectionWidthStyle: BoxWidthStyle.max,
                  decoration: InputDecoration(
                    hintText: 'Input your name',
                    labelText: 'NAME',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    prefixIcon: Icon(Icons.account_box_sharp),
                    border: OutlineInputBorder(gapPadding: 50),
                    fillColor: Colors.blueGrey[200],
                    filled: true,
                  ),
                  keyboardType: TextInputType.name,
                  onChanged: (text) {
                    value = text;
                  },
                  cursorColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  autofocus: false,
                  selectionWidthStyle: BoxWidthStyle.max,
                  decoration: InputDecoration(
                    hintText: 'Input your birthday in form of  (DD-MM)',
                    labelText: 'DATE',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(gapPadding: 50),
                    fillColor: Colors.blueGrey[200],
                    filled: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (text2) {
                    value2 = text2;
                  },
                  cursorColor: Colors.white,
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          FirstPage(value: value, value2: value2)));
                },
                child: Text('press '),
              )
            ],
          ),
        )));
  }
}

class FirstPage extends StatelessWidget {
  String value, value2;
  FirstPage({this.value, this.value2});

  String get resultPhrase {
    var resultText = 'You did it';
    if (value2 == '18-10')
      resultText = ' same as mine . We are birthday buddies!!!!';
    else {
      resultText = ' not same as mine . We are not birthday buddies!!!!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          title: Text('FIRST PAGE'),
          backgroundColor: Colors.cyan,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                children: [
                  Text(
                    'Your Name is:',
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    value + '  ' + 'MY name is Shrishti ',
                    style: TextStyle(
                        backgroundColor: Colors.yellowAccent,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    'Your Birthday is:',
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    resultPhrase,
                    style: TextStyle(
                        backgroundColor: Colors.yellowAccent,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text(' CONTACT  ME '),
            )
          ],
        ));
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact Me!'),
          backgroundColor: Colors.cyan,
        ),
        backgroundColor: Colors.blueAccent[100],
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70.0,
                  backgroundImage: NetworkImage(
                      'data:image/jpeg;base64,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'),
                ),
                Text(
                  "Shrishti Shah",
                  style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.white),
                ),
                Text(
                  "IIITN Student",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.white),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.lightBlueAccent,
                    ),
                    title: Text(
                      '+91 93 xx 99 xxx',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          fontSize: 20.0),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.lightBlueAccent,
                    ),
                    title: Text(
                      'shrishtishah2002@gmail.com',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          fontSize: 20.0),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Text('home screen'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
