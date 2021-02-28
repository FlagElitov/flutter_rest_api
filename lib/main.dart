import 'package:flutter/material.dart';
import 'package:flutter_rest_api/api/fetch_post.dart';
import 'package:flutter_rest_api/models/models.dart';
import 'package:flutter_rest_api/screen/DisplayPost.dart';
import 'package:flutter_rest_api/screen/ListPosts.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Post> posts;

  // ignore: avoid_init_to_null
  int id = null;

  void addId(newId) {
    setState(() {
      id = newId;
    });
  }

  @override
  void initState() {
    super.initState();
    posts = fetchPost(id);

    print(posts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter + RestAPI'),
      ),
      body: NavigationPost(posts: posts, id: id),
    );
  }
}

class NavigationPost extends StatelessWidget {
  final posts;
  final int id;
  const NavigationPost({Key key, this.posts, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Display posts',
      initialRoute: '/',
      routes: {
        '/': (context) => ListPosts(fetchPost: fetchPost, posts: posts),
        '/post': (context) => DisplayPost(posts: posts),
      },
    );
  }
}

