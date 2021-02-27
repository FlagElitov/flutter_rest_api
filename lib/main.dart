import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/models.dart';
import 'package:flutter_rest_api/screen/DisplayPost.dart';
import 'package:flutter_rest_api/screen/ListPosts.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

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
  List<Post> posts;
  Future<Post> fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      setState(() {
        posts = json.decode(response.body);
        print(posts);
      });
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  // ignore: avoid_init_to_null
  int id = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter + RestAPI'),
      ),
      body: NavigationPost(posts: posts, fetchPost: fetchPost, id: id),
    );
  }
}

class NavigationPost extends StatelessWidget {
  final fetchPost;
  final posts;
  final id;
  const NavigationPost({Key key, this.posts, this.fetchPost, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Display posts',
      initialRoute: '/',
      routes: {
        '/': (context) => ListPosts(fetchPost: fetchPost),
        '/post': (context) => DisplayPost(
              fetchPost: fetchPost,
              id: id,
            ),
      },
    );
  }
}

//44444

// class _MyHomePageState extends State<MyHomePage> {
//   // Future<List<Post>> getDate() async {
//   //   String url = 'https://jsonplaceholder.typicode.com/posts';
//   //   http.Response response = await http.get(
//   //     Uri.encodeFull(url),
//   //     headers: {"Accept": "application/json"},
//   //   );
//   //   if (response.statusCode == 200) {
//   //     var post = jsonDecode(response.body);
//   //     print("$post POSTS");
//   //   }

//   //   List<Post> data = jsonDecode(response.body);
//   // }

//   // void gettingData {
//   // Future<List<Posts>> getPosts() async {
//   //   final response = await http.get("https://jsonplaceholder.typicode.com/posts");
//   //   return postsFromJson(response.body);
//   // }
// }

// // int _counter = 20;

// // void increment() {
// //   setState(() {
// //     _counter++;
// //   });
// // }

// void setState(Null Function() param0) {}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Flutter + RestAPI'),
//     ),
//     body: ListView.builder(
//       itemCount: 14,
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//           child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Card(
//                   child: Container(
//                     height: 70,
//                     child: FlatButton(
//                       onPressed: () =>
//                           {Navigator.pushNamed(context, '/create'), print('d')},
//                       child: Text("f"),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }
