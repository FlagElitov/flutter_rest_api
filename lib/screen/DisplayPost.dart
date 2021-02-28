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
      body: ListView.builder(
        // itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                      height: 70,
                      child: FlatButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, '/post'),
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: Text(
                                "id",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "title",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
