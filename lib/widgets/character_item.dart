import 'package:flutter/material.dart';
import 'package:rickandmorty/domain/character.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;

  const CharacterWidget(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(character.name),
                Text(character.status),
                Text(character.species),
              ],
            ),
          ),
          IntrinsicWidth(
            child: AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: character.image,
                placeholder: (context, url) => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
