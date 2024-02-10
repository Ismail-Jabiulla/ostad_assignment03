import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad_assignment03/data_fetch/provider.dart';
import 'package:ostad_assignment03/photo_details.dart';
import 'package:provider/provider.dart';
import 'model/model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PhotoProvider>(context, listen: false).fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<PhotoProvider>(
        builder: (context, photoProvider, child) {
          if (photoProvider.photos.isEmpty) {
            return const CircularProgressIndicator();
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                title: Text('Photo App'),
              ),
              body: ListView.builder(
                itemCount: photoProvider.photos.length,
                itemBuilder: (context, index) {
                  Photo photo = photoProvider.photos[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FullScreenImage(photoUrl: photo.url, photoId: photo.id, photoTitle: photo.title, ),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(photo.title),
                        leading: Image.network(photo.thumbnailUrl),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
