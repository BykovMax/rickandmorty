import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rickandmorty/ui/pages/characters_store.dart';
import 'package:rickandmorty/ui/widgets/character_item.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key, required this.title});

  final String title;

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final CharactersStore store = CharactersStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: store.items.length,
          itemBuilder: (context, index) {
            return CharacterWidget(store.items[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
