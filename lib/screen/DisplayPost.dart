import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/models.dart';

// ignore: must_be_immutable
class DisplayPost extends StatelessWidget {
  final Post posts;

  DisplayPost({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter + RestAPI'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
            },
          )
        ],
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Text(
                "id:45352",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.yellow,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "Title:fgdrga",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.yellow,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "Body:kdfakf dafj afj ajfdkljfksl",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.yellow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
