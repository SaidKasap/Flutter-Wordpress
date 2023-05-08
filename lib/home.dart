import 'package:flutter/material.dart';
import 'config.dart';
import 'wp-api.dart';
import 'menu.dart';
import 'package:dilara/postitem.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _sliderPosts = [];
  List<dynamic> _listPosts = [];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    _fetchSliderPosts();
    _fetchListPosts();
  }

  Future<void> _fetchSliderPosts() async {
    try {
      final sliderPosts = await WPAPISLIDER.fetchPosts();
      setState(() {
        _sliderPosts = sliderPosts.reversed.toList();
      });
    } catch (e) {
      // print('Error: $e');
    }
  }

  Future<void> _fetchListPosts() async {
    try {
      final listPosts = await WPAPISLIDERHOME.fetchPosts();
      setState(() {
        _listPosts = listPosts;
      });
    } catch (e) {
      // print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(APP_TITLE, width: 250, height: 60),
      ),
      body: SingleChildScrollView(
        child: _sliderPosts.isNotEmpty && _listPosts.isNotEmpty
            ? Column(
                children: [
                  SizedBox(
                    height: 320, // slider yüksekliği
                    width: 600,
                    child: CarouselSlider(
                      items: _sliderPosts.map((post) {
                        return PostItem(post: post);
                      }).toList(),
                      carouselController: _controller,
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 8 / 9,
                        viewportFraction: 1.1,
                        enlargeCenterPage: false,
                        reverse: false, // slider ters sıralı oynatma
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _sliderPosts.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 24.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == entry.key
                                ? Colors.blueAccent
                                : Colors.grey,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _listPosts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PostItem(post: _listPosts[index]);
                    },
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
