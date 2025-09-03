import 'package:flutter/material.dart';
import 'package:flutter_task/constant/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 0),
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Use a fallback or check if asset exists
              Container(
                height: 40,
                width: 120,
                child: const Image(
                  image: AssetImage('assets/images/instagram.webp'),
                  fit: BoxFit.cover,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.send,
                    size: 30,
                    color: Colors.black,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Remove fixed height, let ListView.builder size itself
            ListView.builder(
              shrinkWrap: true, // Important: This makes ListView take only needed space
              physics: const NeverScrollableScrollPhysics(), // Disable ListView scrolling since parent is scrollable
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/default.jpg'), // Replace with your asset path
                                  radius: 20,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  posts[index].userName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(Icons.more_vert_outlined)
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Handle image with proper error handling
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300, // Fixed height for images
                        child: Image.asset(
                          posts[index].postUrl ?? 'assets/images/Screenshot_20250827_020557_Instagram.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/Screenshot_20250827_020557_Instagram.jpg',
                            fit: BoxFit.cover,
                          );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.favorite_border_outlined, size: 25),
                                const SizedBox(width: 15),
                                const Icon(Icons.comment_outlined, size: 22),
                                const SizedBox(width: 15),
                                const Icon(Icons.send_outlined, size: 22),
                              ],
                            ),
                            const Icon(Icons.bookmark_border_outlined, size: 25),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '${posts[index].likes.toString()} likes, liked by me and ${posts[index].likes - 1} others',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Wrap( // Use Wrap to prevent overflow
                          children: [
                            Text(
                              posts[index].userName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              posts[index].postDesc,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 7),
                        child: Text(
                          'View all ${posts[index].comments} Comments',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          '${posts[index].uploadedOn} ago',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}