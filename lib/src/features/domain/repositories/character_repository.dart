import 'package:list_app/src/features/data/datasources/api_service.dart';
import 'package:list_app/src/features/data/models/character_model.dart';

import '../../data/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final ApiService apiService;

  CharacterRepositoryImpl({required this.apiService});

  @override
  Future<List<CharacterModel>> fetchCharacters() async {
    try {
      final List<dynamic> data = await apiService.fetchCharacters();
      final List<CharacterModel> characters = data
          .map((item) => CharacterModel(
                id: item['id'],
                name: item['name'],
                image: item['image'],
              ))
          .toList();
      return characters;
    } catch (e) {
      throw Exception('Failed to fetch characters: $e');
    }
  }
}
