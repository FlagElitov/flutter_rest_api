import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DisplayPost extends StatelessWidget {
  final fetchPost;
  int id;
  DisplayPost({Key key, this.id, this.fetchPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO app'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: 'Open shopping cart',
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Text(
                "id:$id",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.yellow,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "id:$id",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.yellow,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "id:$id",
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
