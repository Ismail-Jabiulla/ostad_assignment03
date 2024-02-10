import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class PhotoProvider with ChangeNotifier {
  List<Photo> _photos = [];

  List<Photo> get photos => _photos;

  Future<void> fetchPhotos() async {
    const url = 'https://jsonplaceholder.typicode.com/photos';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<Photo> loadedPhotos = [];

        data.forEach((photoData) {
          loadedPhotos.add(Photo(
            id: photoData['id'],
            albumId: photoData['albumId'],
            title: photoData['title'],
            url: photoData['url'],
            thumbnailUrl: photoData['thumbnailUrl'],
          ));
        });

        _photos = loadedPhotos;
        notifyListeners();
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (error) {
      throw error;
    }
  }
}
