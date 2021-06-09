import 'package:flutter/material.dart';
import 'package:iti_actors/models/Actor.dart';
import 'package:iti_actors/ui/detail_screen/detail_screen_provider.dart';
import 'package:iti_actors/widgets/photos_grid.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ActorInfoWidget extends StatelessWidget {
  final ActorProvider actorProvider;
  final Actor actor;
  ActorInfoWidget({this.actorProvider, this.actor});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('${actorProvider.actor.name}',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Birthday: ${actorProvider.actor.birthDate}',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Birth Place: ${actorProvider.actor.birthPlace}',
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: SmoothStarRating(
                  allowHalfRating: true,
                  onRated: (v) {},
                  starCount: 10,
                  rating: actor.popularity,
                  size: 23,
                  isReadOnly: true,
                  filledIconData: Icons.star_rate,
                  halfFilledIconData: Icons.star_half,
                  color: Colors.orangeAccent,
                  borderColor: Colors.black,
                  spacing: 0.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Biography: ${actorProvider.actor.biography}',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
            actorProvider.actor.imagesProfiles != null
                ? PhotosGrid(
                    name: actorProvider.actor.name,
                    imageProfiles: actorProvider.actor.imagesProfiles,
                  )
                : Text('')
          ],
        ),
      ),
    );
  }
}
