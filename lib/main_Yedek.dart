import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:core';

import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future api35() async{
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url =
    Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

/*

  List? data;
  List imagesUrl = [];
  Future<String> fetchDataFromApi() async {
    var url=Uri.https('s3-us-west-2.amazonaws.com/appsdeveloperblog.com/tutorials/files/cats.json');
    //Response jsonData = await http.get('https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/tutorials/files/cats.json');
    var jsonData = await http.get($url);
    var fetchData = jsonDecode(jsonData.body);

    setState(() {
      data = fetchData;
      data.forEach((element) {
        imagesUrl.add(element['url']);
      });
    });

    return "Success";
  }
*/
  apideneme() async {
    var url = Uri.parse('https://example.com/whatsit/create');
    var response = await http.post(
        url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    //print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //api35();
    apideneme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'image_api',
      home: Scaffold(
        appBar: AppBar(
          title: Text('image_api'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('image_api'),
            ],
          ),
        ),
      ),
    );
  }
}
