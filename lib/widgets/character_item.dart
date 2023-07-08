import 'package:flutter/material.dart';
import 'package:rickandmorty/entities/character.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;

  const CharacterWidget(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(character.name),
                  Text(character.status),
                  Text(character.species),
                ],
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: CachedNetworkImage(
                imageUrl: character.image,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
