// import 'package:flutter/material.dart';
// import 'package:flutter_rest_api/api/fetch_post.dart';
// import 'package:flutter_rest_api/models/models.dart';
// import 'package:flutter_rest_api/screen/DisplayPost.dart';
// import 'package:flutter_rest_api/screen/ListPosts.dart';
// import 'dart:async';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Future<Post> posts;

//   // ignore: avoid_init_to_null
//   int id = null;

//   void addId(newId) {
//     setState(() {
//       id = newId;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     posts = fetchPost(id);

//     print(posts);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter + RestAPI'),
//       ),
//       body: NavigationPost(posts: posts, id: id),
//     );
//   }
// }

// class NavigationPost extends StatelessWidget {
//   final posts;
//   final int id;
//   const NavigationPost({Key key, this.posts, this.id}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Display posts',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => ListPosts(posts: posts),
//         '/post': (context) => DisplayPost(posts: posts),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/api/fetch_post.dart';
import 'package:flutter_rest_api/models/models.dart';
import 'package:flutter_rest_api/screen/DisplayPost.dart';
import 'package:flutter_rest_api/screen/ListPosts.dart';
import 'dart:async';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(home: new HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;

  Future<String> getData() async {
    String url = "https://jsonplaceholder.typicode.com/posts/";
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });
    print(data[id - 1]["title"]);
  }

  int id = 3;

  void changeId(newId) {
    setState(() {
      id = newId;
    });
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List views"), backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              height: 70,
              child: FlatButton(
                onPressed: () => {
                  this.getData(),
                  changeId(data[index]["id"]),
                },
                child: Text(
                  data[index]["title"],
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
// class NavigationPost extends StatelessWidget {
//   final posts;
//   final int id;
//   const NavigationPost({Key key, this.posts, this.id}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Display posts',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => ListPosts(posts: posts),
//         '/post': (context) => DisplayPost(posts: posts),
//       },
//     );
//   }
// }
