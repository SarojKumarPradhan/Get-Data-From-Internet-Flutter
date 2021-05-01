import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //**********************************************************
  var resData, resStatusCode;
  Future<void> getData() async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
    print(response.body);
    print(response.statusCode);
    //-----------------------------
    setState(() {
      resData = response.body;
      resStatusCode = response.statusCode;
    });
  }
  //***********************************************************

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    //***************************
                    getData();
                    //***************************
                  },
                  child: Text('Get Data & Staus Code !!'),
                ),
                //***************************
                Text(
                    "Status Code => $resStatusCode \n\n\nData => \n\n$resData"),
                //***************************
              ],
            ),
          ),
        ),
      ),
    );
  }
}
