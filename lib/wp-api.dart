// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class WPAPISLIDER {
  static Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('$URL$URLPLS/wp/v2/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Yayınlar yüklenemedi');
    }
  }
}

class WPAPISLIDERHOME {
  static Future<List<dynamic>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('$URL$URLPLS/wp/v2/posts?tags=18'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Yayınlar yüklenemedi');
    }
  }
}

class WPAPIPOST {
  static Future<dynamic> fetchPosts(int postId) async {
    final response =
        await http.get(Uri.parse('$URL$URLPLS/wp/v2/posts/$postId'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Yayınlar yüklenemedi');
    }
  }
}
