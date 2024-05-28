import 'package:apiwith_provider/screens/instagram/commets_sheet.dart';
import 'package:apiwith_provider/screens/instagram/user_screen.dart';
import 'package:apiwith_provider/theme/app_theme.dart';
import 'package:apiwith_provider/theme/theme_constant.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final String name;
  final String postbody;
  final int userId;
  final String userName;
  const PostCard({
    super.key,
    required this.name,
    required this.postbody,
    required this.userId,
    required this.userName,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      elevation: 2.0,
      shadowColor: Colors.redAccent,
      surfaceTintColor: Colors.pinkAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      clipBehavior: Clip.none,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserScreen(
                      id: widget.userId,
                      userName: widget.userName,
                    ),
                  ),
                );
              },
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.red.shade200,
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: AppColors.apni11White,
                  child: Text(
                    widget.name.isNotEmpty ? widget.name : 'N',
                    style: boldBlack.copyWith(fontSize: 12),
                  ),
                ),
              ),
              title: Text(
                widget.name,
                style: boldRed,
              ),
              subtitle: Text(
                '29/01/2020',
                style: boldRed,
              ),
              trailing: const Icon(
                Icons.more_vert,
                size: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Text(
                widget.postbody,
                style: boldBlack.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.favorite_border),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          commentsSheet(context);
                        },
                        child: const Icon(Icons.comment),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.share)
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.save_alt),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
