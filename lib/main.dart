import 'package:flutter/material.dart';
import 'package:rickandmorty/injection.dart';
import 'package:rickandmorty/ui/pages/characters_page.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CharactersPage(title: 'Rick and Morty'));
  }
}
