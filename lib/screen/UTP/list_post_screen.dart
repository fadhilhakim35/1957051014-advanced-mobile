import 'package:flutter/material.dart';
import 'package:justduit/screen/UTP/models/post_model.dart';

class ListPostScreen extends StatefulWidget {
  const ListPostScreen({super.key});

  @override
  State<ListPostScreen> createState() => _ListPostScreenState();
}

class _ListPostScreenState extends State<ListPostScreen> {
  var post = PostModel().getPost();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 3));
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 50),
                  child: Image.asset(
                    'assets/images/logo2.png',
                    width: 200,
                  ),
                ),
                ListView.builder(
                  itemCount: post.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      width: double.infinity,
                      height: 200,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        AssetImage(post[index].profilePhotoUrl!),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hai,",
                                        style: TextStyle(fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                          color: Colors.blue,
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(post[index].photoUrl!)),
                              ),
                          ],
                        ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 