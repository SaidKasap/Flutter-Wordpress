import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PostItem extends StatelessWidget {
  final Map<String, dynamic> post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetail(post: post),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
            color: Colors.grey.shade300,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            post['jetpack_featured_media_url'] != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      post['jetpack_featured_media_url'],
                      fit: BoxFit.cover,
                      height: 200,
                      width: 600,
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                post['title']['rendered'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostDetail extends StatelessWidget {
  final Map<String, dynamic> post;

  const PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post['title']['rendered']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            post['featured_media_url'] != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      post['featured_media_url'],
                      fit: BoxFit.cover,
                      height: 400,
                      width: double.infinity,
                    ),
                  )
                : Image.asset(
                    'images/logo.png',
                    fit: BoxFit.cover,
                    height: 400,
                    width: double.infinity,
                  ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Html(data: post['content']['rendered']),
            ),
          ],
        ),
      ),
    );
  }
}

class PostItemSlider extends StatelessWidget {
  final Map<String, dynamic> post;

  const PostItemSlider({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetail(post: post),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
            color: Colors.grey.shade300,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            post['jetpack_featured_media_url'] != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      post['jetpack_featured_media_url'],
                      fit: BoxFit.cover,
                      height: 280,
                      width: 400,
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                post['title']['rendered'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
