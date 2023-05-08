import 'package:flutter/material.dart';

import 'categorypostspage.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  Future<void> launchLink(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      'images/logo.png',
      width: 240,
      height: 240,
    );
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: image,
          ),
          ListTile(
            title: const Text('Ana Sayfa'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ExpansionTile(
            title: const Text('Nakşibendî Müceddidî Silsilesi'),
            leading: const Icon(Icons.video_call),
            children: <Widget>[
              ListTile(
                title: const Text('Nakşibendî Müceddidî Silsilesi'),
                leading: const Icon(Icons.room_preferences),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PostDetail(
                          postId:
                              117), // Gönderilecek postId değerini değiştirebilirsiniz
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Silsile'),
                leading: const Icon(Icons.browse_gallery),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryPostsPage(
                        categoryId: (24),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Üstadımız'),
            leading: const Icon(Icons.date_range_outlined),
            children: <Widget>[
              ListTile(
                title: const Text('Tarihçe-i Hayatı'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PostDetail(
                          postId:
                              47), // Gönderilecek postId değerini değiştirebilirsiniz
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Vasiyeti'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PostDetail(
                          postId:
                              49), // Gönderilecek postId değerini değiştirebilirsiniz
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Eserleri'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryPostsPage(
                        categoryId: (16),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Fotoğraf ve Video Galerisi'),
            leading: const Icon(Icons.video_call),
            children: <Widget>[
              ListTile(
                title: const Text('Fotoğraf Galerisi'),
                leading: const Icon(Icons.image),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryPostsPage(
                        categoryId: (7),
                      ),
                    ),
                  );
                },
              ),
              ExpansionTile(
                title: const Text('Video Galerisi'),
                leading: const Icon(Icons.video_call),
                children: <Widget>[
                  ListTile(
                    title: const Text('Hasbihal Programı'),
                    leading: const Icon(Icons.browse_gallery),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CategoryPostsPage(
                            categoryId: (14),
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Hatme-i Hâcegan Sohbetleri'),
                    leading: const Icon(Icons.browse_gallery),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CategoryPostsPage(
                            categoryId: (13),
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Talebeleri Üstad’ı anlatıyor'),
                    leading: const Icon(Icons.browse_gallery),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CategoryPostsPage(
                            categoryId: (22),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Sorular ve Cevaplar'),
            leading: const Icon(Icons.date_range_outlined),
            children: <Widget>[
              ListTile(
                title: const Text('Sorular ve Cevaplar'),
                leading: const Icon(
                  Icons.link,
                  color: Colors.black,
                  size: 30,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryPostsPage(
                        categoryId: (12),
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                  leading: const Icon(
                    Icons.link,
                    color: Colors.black,
                    size: 30,
                  ),
                  title: const Text(
                    'Soru Sor',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    launchLink('https://www.dilara.net/soru-sor/',
                        isNewTab: true);
                  })
            ],
          ),
          ListTile(
            title: const Text('Köşe Yazıları'),
            leading: const Icon(Icons.list),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoryPostsPage(
                    categoryId: (9),
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Radyo Dilara'),
            leading: const Icon(Icons.replay_circle_filled_outlined),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostDetail(
                      postId:
                          1176), // Gönderilecek postId değerini değiştirebilirsiniz
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
