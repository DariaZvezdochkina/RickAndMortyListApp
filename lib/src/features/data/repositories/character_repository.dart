import '../models/character_model.dart';

abstract class CharacterRepository {
  Future<List<CharacterModel>> fetchCharacters();
}
