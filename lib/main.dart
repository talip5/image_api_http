import 'dart:convert';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:core';
import 'package:path_provider/path_provider.dart';
import 'package:fastimage/fastimage.dart';
import 'dart:io' as Io;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Map<String,dynamic>> listMap=[];
  List<String> denemejson=[];
  List? data;
  List imagesUrl = [];

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

  deneme5() async{
    Directory? tempDir = await getExternalStorageDirectory();
    String tempPath = tempDir!.path;
    print(tempPath);
    //final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    final response = await http.get(Uri.parse('https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/tutorials/files/cats.json'));
    //print(response.statusCode);
    //print(response.body);
    //print(response.request); //GET https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/tutorials/files/cats.json
    //print(response.body.split('"url"').last);
       var fetchData = jsonDecode(response.body);
    setState(() {
      data = fetchData;
      data!.forEach((element) {
        imagesUrl.add(element['url']);
      });
    });
    print(imagesUrl.length);
    print(imagesUrl.first);
    var imageFilePath=imagesUrl.first;
    //File imageFile=File('$imageFilePath');
    //imageFile.createSync();
    //File deneme5=File('$tempPath/image5.jpg');
    //deneme5.createSync();
   // imageFile.copy('$tempPath/image5.jpg');
    print(imageFilePath);
  }

  jpgdeneme() async{
    Directory? tempDir = await getExternalStorageDirectory();
    String tempPath = tempDir!.path;
    final response = await http.get(Uri.parse('https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/images/cats/cat-1.jpg'));
    //print('jpg');
    //print(response.statusCode);
    //print(response.bodyBytes);
    var _profileImage = Image.memory(response.bodyBytes).image;
   // _profileImage.copy('$tempPath/image5.jpg');
    print(_profileImage.runtimeType);
  }

  denemejpg1() async{
    final fastImage = FastImage();
    final response = await fastImage.getSize("http://i.imgur.com/7GLI90s.jpg");
    fastImage.close(); // non-shared instances of FastImage should be closed

    print(response.size.height);
// Prints: `GetSizeResponse(size: ImageSize(width: 1600, height: 1200), format: ImageFormat.jpeg)`
  }

  denemejpg35() async{
    Directory? tempDir = await getExternalStorageDirectory();
    String tempPath = tempDir!.path;
    final response = await http.get(Uri.parse('https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/images/cats/cat-1.jpg'));
    //final response = await http.get(Uri.parse("http://i.imgur.com/7GLI90s.jpg"));
    print(response.body.length);
    var img64=response.bodyBytes;
    print(img64);
      // img64 = iVBORw0KGgoAAAANSUhEUgAAB...
    var img64encode=base64.encode(img64);
    print(img64encode);
      final decodedBytes = base64Decode(img64encode);

      var file = Io.File('$tempPath/image5.jpg');
      //file.writeAsBytesSync(decodedBytes);
    file.writeAsBytesSync(decodedBytes);
    }

  denemejpg() async{
    Directory? tempDir = await getExternalStorageDirectory();
    String tempPath = tempDir!.path;
    final response = await http.get(Uri.parse('https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/images/cats/cat-6.jpg'));
    //final response = await http.get(Uri.parse("http://i.imgur.com/7GLI90s.jpg"));
    var img64=response.bodyBytes;
    //var img64encode=base64.encode(img64);
    //final decodedBytes = base64Decode(img64encode);

    //var file = Io.File('$tempPath/image55.jpg');
    var file = File('$tempPath/image35.jpg');
    //file.writeAsBytesSync(decodedBytes);
    file.writeAsBytesSync(response.bodyBytes);
  }

 /* List list=response.data as List;
  print(list.length);
  //print(list.elementAt(0));
  for(int i=0; i<list.length; i++){
  (list.elementAt(i) as Map).forEach((key, value) {
  print('$key   $value');
  });}*/

  json35() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    (response.body as Map<String,dynamic>).forEach((key, value) {
      print(key);
    });
  }

  json15() async{
    //final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    String response_json=response.body;
    var decoded = json.decode(response_json);
    Map<String,dynamic> map;
    map=decoded;
    print(decoded);
    map.forEach((key, value) {
      print(key);
    });
  }

  json5() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
   String response_json=response.body;
    var decoded = json.decode(response_json);
    print(decoded.runtimeType);
    List<dynamic> list=decoded;
    print(list.length);
    //print(list[0]);
    for(int i=0;i<10;i++) {
      Map<String,dynamic> map=list[i];
    map.forEach((key, value) {
        print('$key : $value');
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    json5();
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
class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
  };
}