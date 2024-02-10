import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String photoUrl;
  final int photoId;
  final String photoTitle;
  FullScreenImage({required this.photoUrl,required this.photoId, required this.photoTitle });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Photo Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(photoUrl),
            SizedBox(height: 60),
            Text(photoTitle),
            Text('ID: ${photoId.toString()}'),
          ],
        ),
      ),
    );
  }
}
