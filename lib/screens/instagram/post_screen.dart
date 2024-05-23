import 'package:apiwith_provider/models/user_model.dart';
import 'package:apiwith_provider/provider/post_provider.dart';
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

  @override
  void initState() {
    provider = Provider.of<PostProvider>(context, listen: false);
    provider.getAllUsers().then((value) {
      setState(() {
        loading = false;
      });
    });
    //  await provider.getPostApi().then((value) {
    //     setState(() {
    //       loading = false;
    //     });
    //   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/instgram.png',
              ),
            ),
          ),
        ),
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
              padding: EdgeInsets.all(8.0),
              child: Card(
                  child: Selector<PostProvider, UsersModel?>(
                selector: (p0, p1) => p1.userModel,
                builder: (context, user, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: Text('AV'),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(user?.name ?? 'no name'),
                                  Text('29/01/2020'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Icon(Icons.more_vert)
                    ],
                  );
                },
              )),
            ),
    );
  }
}
