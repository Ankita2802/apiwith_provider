import 'dart:developer';
import 'package:apiwith_provider/components/post_card.dart';
import 'package:apiwith_provider/models/post_model.dart';
import 'package:apiwith_provider/provider/post_provider.dart';
import 'package:apiwith_provider/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late PostProvider provider;
  bool loading = true;
  Map<int, String> userNames = {};
  Map<int, String> profileUserName = {};
  String fullName = '';
  int postId = 0;
  int commentsId = 0;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<PostProvider>(context, listen: false);
    fetchData();
  }

  Future<void> fetchData() async {
    await provider.getPostApi().then((value) {
      for (var item in provider.postmodel) {
        setState(() {
          postId = item.userId!;
        });
      }
    });
    await initPrefs();
    await initPrefcomments(postId);
    setState(() {
      loading = false;
    });
  }

  Future<void> initPrefs() async {
    await provider.getAllUsers().then((value) {
      for (var item in provider.userModel) {
        if (item.id != null && item.name != null) {
          log(item.name.toString(), name: 'name post users');
          final name = item.name.toString();
          final userName = item.username.toString();
          List<String> words = name.split(' ');

          if (words.length >= 2) {
            String firstNameInitial = words[0][0];
            String lastNameInitial = words[1][0];
            fullName = firstNameInitial + lastNameInitial;

            log(fullName, name: 'initial string');
          }
          userNames[item.id!] = fullName;
          profileUserName[item.id!] = userName;
          // log('User ID: ${item.id}, Name: ${item.name}', name: 'User Data');
        }
      }
    });
  }

  Future<void> initPrefcomments(int posiId) async {
    print('call');
    for (var item in provider.commentModel) {
      print('call');
      log(posiId.toString(), name: 'postid');
      setState(() async {
        var id = item.postId;
        log(id.toString(), name: 'id');
        if (postId == id) {
          print('true');
          await provider.getCommentsAPI(posiId);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red[900],
        title: Text(
          'Instagram',
          style: boldWhite,
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite_border_sharp,
              color: Colors.white,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.person_3_outlined,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Selector<PostProvider, List<PostsModel>>(
                  selector: (p0, p1) => p1.postmodel,
                  builder: (context, post, child) {
                    return ListView.builder(
                      itemCount: post.length,
                      itemBuilder: (context, index) {
                        var postItem = post[index];
                        var userId = postItem.userId;
                        var userName = userNames[userId] ?? 'No name';
                        var postname = profileUserName[userId] ?? 'No name';
                        return PostCard(
                          name: userName,
                          postbody: postItem.body ?? 'no body',
                          userId: postItem.userId ?? 0,
                          userName: postname,
                        );
                      },
                    );
                  }),
            ),
    );
  }
}
