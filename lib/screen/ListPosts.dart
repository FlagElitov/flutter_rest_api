import 'package:flutter/material.dart';

class ListPosts extends StatelessWidget {
  final fetchPost;
  final posts;
  final int id;
  ListPosts({Key key, this.fetchPost, this.id, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 14,
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
                        fetchPost(id)
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Text(
                              "Flag 423",
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text("dfs"),
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
    );
  }
}
