import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/entities/character.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key, required this.character});

  final Character character;

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  // final CharactersStore store = CharactersStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.character.name,
          style: const TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Theme.of(context).colorScheme.secondary, Colors.transparent],
          )),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.fill,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: widget.character.image,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.character.toString()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add to favorite list',
        child: _favorite(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _favorite() {
    if (widget.character.id > 2) {
      return const Icon(Icons.favorite_border);
    } else {
      return const Icon(Icons.favorite);
    }
  }
}
