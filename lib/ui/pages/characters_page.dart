import 'package:domain/domain.dart';
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
      floatingActionButton: Observer(builder: (context) {
        return FloatingActionButton(
          onPressed: () {
            buildShowModalBottomSheet(context);
          },
          tooltip: 'Filter',
          child: Icon(
            Icons.filter_list,
            color: store.isFilterActive ? Colors.redAccent : Colors.black,
          ),
        );
      }),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FilledButton(
                          child: const Text('Clear Filter'),
                          onPressed: () {
                            store.clearFilter();
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                  const Text('Gender'),
                  Observer(
                      builder: (context) => Wrap(
                            spacing: 8,
                            children: CharacterGender.values
                                .where((element) => element != CharacterGender.empty)
                                .map((e) => ChoiceChip(
                                      label: Text(e.value),
                                      selected: store.filter.gender == e,
                                      onSelected: (bool selected) {
                                        setState(() {
                                          store.setGender(selected ? e : CharacterGender.empty);
                                        });
                                      },
                                    ))
                                .toList(),
                          )),
                  const Text('Status'),
                  Observer(
                      builder: (context) => Wrap(
                            spacing: 8,
                            children: CharacterStatus.values
                                .where((element) => element != CharacterStatus.empty)
                                .map((e) => ChoiceChip(
                                      label: Text(e.value),
                                      selected: store.filter.status == e,
                                      onSelected: (bool selected) {
                                        setState(() {
                                          store.setStatus(selected ? e : CharacterStatus.empty);
                                        });
                                      },
                                    ))
                                .toList(),
                          )),
                  const Text('Species'),
                  Observer(
                      builder: (context) => Wrap(
                            spacing: 8,
                            children: CharacterSpecies.values
                                .where((element) => element != CharacterSpecies.empty)
                                .map((e) => ChoiceChip(
                                      label: Text(e.value),
                                      selected: store.filter.species == e,
                                      onSelected: (bool selected) {
                                        setState(() {
                                          store.setSpecies(selected ? e : CharacterSpecies.empty);
                                        });
                                      },
                                    ))
                                .toList(),
                          )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
