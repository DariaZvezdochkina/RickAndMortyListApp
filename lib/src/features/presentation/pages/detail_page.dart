import 'package:flutter/material.dart';

import '../../data/models/character_model.dart';

class DetailPage extends StatelessWidget {
  final CharacterModel character;

  const DetailPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Image.network(character.image),
            const SizedBox(height: 16),
            Text('Name: ${character.name}'),
            const SizedBox(height: 16),
            Text('ID: ${character.id}'),
          ],
        ),
      ),
    );
  }
}
