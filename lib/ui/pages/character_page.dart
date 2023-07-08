import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rickandmorty/entities/character.dart';
import 'package:rickandmorty/ui/pages/character_store.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({
    required this.characterId,
    super.key,
  });

  final String characterId;

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  late CharacterStore _store;

  @override
  void initState() {
    _store = CharacterStore(widget.characterId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final state = _store.loading;
      return switch (state) {
        Loading() => const Scaffold(
              body: Center(
            child: SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                )),
          )),
        Error() => const Text("try again"),
        Result() => loaded(context, state.character),
      };
    });
  }

  Scaffold loaded(BuildContext context, Character character) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          character.name,
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
                fit: BoxFit.cover,
                imageUrl: character.image,
                placeholder: (context, url) => const CircularProgressIndicator(
                  strokeWidth: 4,
                ),
                errorWidget: (context, url, error) => const SizedBox(
                  width: 100,
                  height: 100,
                  child: Icon(Icons.error),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(character.toString()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add to favorite list',
        child: _favorite(),
      ),
    );
  }

  Widget _favorite() {
    // if (character.id > 2) {
    return const Icon(Icons.favorite_border);
    // } else {
    //   return const Icon(Icons.favorite);
    // }
  }
}
