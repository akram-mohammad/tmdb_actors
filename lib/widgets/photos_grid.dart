import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iti_actors/ui/image_screen/ImageScreen.dart';

class PhotosGrid extends StatelessWidget {
  final String name;
  final List imageProfiles;
  PhotosGrid({this.name, this.imageProfiles});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics:
          NeverScrollableScrollPhysics(), // to disable GridView's scrolling
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 8.0 / 9.0,
      children: imageProfiles
          .map<Widget>(
            (i) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ImageScreen(name: name, imgPath: i['file_path']),
                    ),
                  );
                },
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: 'https://image.tmdb.org/t/p/w500${i['file_path']}',
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
