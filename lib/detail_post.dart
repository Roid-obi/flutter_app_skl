import 'package:flutter/material.dart';

class Comment {
  final String user;
  final String comment;

  Comment({required this.user, required this.comment});
}

class DetailPostPage extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final int likes;
  final String category;

  const DetailPostPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.likes,
    required this.category,
  }) : super(key: key);

  @override
  _DetailPostPageState createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> {
  List<Comment> comments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 8),
                Text(
                  'Mapel : ${widget.category}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 8),
                Text(
                  '${widget.likes} menyukai',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://source.unsplash.com/500x500?anime'),
                    ),
                    title: Text(comment.user),
                    subtitle: Text(comment.comment),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Komentar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Tambahkan komentar...',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (comment) {
                    setState(() {
                      comments.add(Comment(user: 'User', comment: comment));
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
