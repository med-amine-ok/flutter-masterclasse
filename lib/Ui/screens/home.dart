import 'package:flutter/material.dart';
import 'package:flutter_task/model/post.dart';
import 'package:flutter_task/widgets/instacard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: 0,
          ),
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
                  Icon(Icons.send, size: 30, color: Colors.black)
                ],
              ),
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
            FutureBuilder<List<PostModel>>(
              future: fetchPosts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No posts available'));
                } else {
                  final posts = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true, // Important: This makes ListView take only needed space
                    physics: const NeverScrollableScrollPhysics(), // Disable ListView scrolling since parent is scrollable
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return InstagramCard(post: posts[index]);
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<PostModel>> fetchPosts() async {
  try {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((post) => PostModel.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  } catch (e) {
    throw Exception('Error fetching posts: $e');
  }
}