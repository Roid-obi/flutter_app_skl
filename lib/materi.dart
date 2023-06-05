import 'package:flutter/material.dart';
import 'dart:math';
import 'detail_post.dart';

class MateriPage extends StatelessWidget {
  const MateriPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Sekolah'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: MateriSearch(),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return MateriCard(
                  title: 'Materi ${index + 1}',
                  description: getRandomDescription(),
                  imageUrl: getRandomImageUrl(),
                  likes: getRandomLikes(),
                  category: getRandomCategory(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String getRandomDescription() {
    List<String> descriptions = [
      'Pengenalan sifat benda padat, cair, dan gas.',
      'Perhitungan dasar dalam matematika.',
      'Pengenalan jenis-jenis tumbuhan.',
      'Sejarah Indonesia pada zaman kolonial.',
      'Pengenalan seni lukis dalam budaya lokal.',
    ];
    final random = Random();
    return descriptions[random.nextInt(descriptions.length)];
  }

  String getRandomImageUrl() {
    List<String> imageUrls = [
      'https://source.unsplash.com/500x400?science',
      'https://source.unsplash.com/500x400?math',
      'https://source.unsplash.com/500x400?history',
      'https://source.unsplash.com/500x400?art',
    ];
    final random = Random();
    return imageUrls[random.nextInt(imageUrls.length)];
  }

  int getRandomLikes() {
    final random = Random();
    return random.nextInt(100) + 1;
  }

  String getRandomCategory() {
    List<String> categories = [
      'IPA',
      'Matematika',
      'Biologi',
      'Sejarah',
      'Seni',
    ];
    final random = Random();
    return categories[random.nextInt(categories.length)];
  }
}

class MateriSearch extends StatelessWidget {
  const MateriSearch({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Cari materi...',
            border: InputBorder.none,
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintStyle: TextStyle(color: Colors.white54),
          ),
        ),
      ),
    );
  }
}

class MateriCard extends StatelessWidget {
  const MateriCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.likes,
    required this.category,
  }) : super(key: key);

  final String title;
  final String description;
  final String imageUrl;
  final int likes;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPostPage(
                title: title,
                description: description,
                imageUrl: imageUrl,
                likes: likes,
                category: category,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(4),
                    ),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$likes menyukai',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



