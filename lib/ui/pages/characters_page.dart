import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rickandmorty/ui/pages/characters_store.dart';
import 'package:rickandmorty/ui/widgets/character_item.dart';
import 'package:rickandmorty/ui/widgets/search_text_widget.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key, required this.title});

  final String title;

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final CharactersStore store = CharactersStore();
  bool _searchBoolean = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (!_searchBoolean)
            IconButton(
              onPressed: () {
                setState(() {
                  _searchBoolean = !_searchBoolean;
                });
              },
              icon: const Icon(Icons.search),
            ),
          if (_searchBoolean)
            IconButton(
              onPressed: () {
                setState(() {
                  _searchBoolean = !_searchBoolean;
                  store.typeSearch('');
                });
              },
              icon: const Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: !_searchBoolean
            ? Text(widget.title)
            : SearchTextWidget(
                onChanged: (String query) {
                  store.typeSearch(query);
                },
              ),
      ),
      body: Observer(builder: (_) {
        final state = store.state;
        return switch (state) {
          Result() => ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                return CharacterWidget(state.characters[index]);
              },
            ),
          Error() => const Center(
              child: Text("Error"),
            ),
          Loading() => const Center(
              child: CircularProgressIndicator(),
            ),
        };
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildShowModalBottomSheet(context);
        },
        tooltip: 'Filter',
        child: const Icon(Icons.filter_list),
      ),
    );
  }

  Future<void> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return FittedBox(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 100,
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      ElevatedButton(
                        child: const Text('Clear Filter'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  // Observer(
                  //   builder: (_) => ListView.builder(
                  //     itemCount: store.items.length,
                  //     itemBuilder: (context, index) {
                  //       return ListTile(
                  //         title: Text(store.items[index].name),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
