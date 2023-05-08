import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'config.dart';
import 'wp-api.dart';

class CategoryPostsPage extends StatefulWidget {
  final int categoryId;

  const CategoryPostsPage({Key? key, required this.categoryId})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CategoryPostsPageState createState() => _CategoryPostsPageState();
}

class _CategoryPostsPageState extends State<CategoryPostsPage> {
  List<dynamic> _posts = [];
  List<dynamic> catagorname = [];
  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    final response = await http.get(Uri.parse(
        '$URL$URLPLS/wp/v2/posts?categories=${widget.categoryId.toString()}&per_page=100&page=1&orderby=date&order=desc'));
    if (response.statusCode == 200) {
      setState(() {
        _posts = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DİLARA NET '),
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (BuildContext context, int index) {
          final post = _posts[index];
          return Card(
            child: ListTile(
              title: Text(post['title']['rendered']),
              leading: Image.network(
                post['jetpack_featured_media_url'],
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text(post['title']['rendered']),
                      ),
                      body: SingleChildScrollView(
                        child: Html(data: post['content']['rendered']),
                      ),
                    );
                  },
                ));
              },
            ),
          );
        },
      ),
    );
  }
}

class PostDetail extends StatefulWidget {
  final int postId;

  const PostDetail({super.key, required this.postId});

  @override
  // ignore: library_private_types_in_public_api
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  dynamic _post;

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  Future<void> fetchPost() async {
    try {
      final post = await WPAPIPOST.fetchPosts(widget.postId);
      setState(() {
        _post = post;
      });
    } catch (e) {
      // print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_post != null ? _post['title']['rendered'] : ''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _post != null
              ? Html(
                  data: _post['content']['rendered'],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
