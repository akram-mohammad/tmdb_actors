import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_actors/ui/detail_screen/DetailScreen.dart';
import 'package:iti_actors/ui/list_screen/list_screen_provider.dart';
import 'package:iti_actors/widgets/actor_card.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ActorsProvider>(
      create: (context) => ActorsProvider(),
      child: Consumer<ActorsProvider>(
        builder: (buildContext, actorProvider, _) {
          return (actorProvider.actors.isNotEmpty)
              ? ListView.builder(
                  controller: actorProvider.scrollController,
                  itemCount: actorProvider.actors.length,
                  itemBuilder: (ctx, index) {
                    final actor = actorProvider.actors[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                title: Text(actor.name),
                              ),
                              body: DetailScreen(index: index, actor: actor),
                            ),
                          ),
                        );
                      },
                      child: ActorCard(
                        actor: actor,
                      ),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
