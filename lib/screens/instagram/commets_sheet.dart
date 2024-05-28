import 'package:apiwith_provider/models/comments_model.dart';
import 'package:apiwith_provider/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<dynamic> commentsSheet(BuildContext context) {
  return showModalBottomSheet(
    clipBehavior: Clip.none,
    backgroundColor: Colors.red[400],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
    ),
    context: context,
    builder: (BuildContext context) {
      return Selector<PostProvider, List<CommentsModel>>(
          selector: (p0, p1) => p1.commentModel,
          builder: (context, comment, child) {
            return ListView.builder(
                itemCount: comment.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.photo),
                        title: Text(comment[index].name ?? 'no name'),
                        onTap: () {
                          // Handle the photo tap
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.music_note),
                        title: Text('Music'),
                        onTap: () {
                          // Handle the music tap
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.videocam),
                        title: Text('Video'),
                        onTap: () {
                          // Handle the video tap
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                });
          });
    },
  );
}
