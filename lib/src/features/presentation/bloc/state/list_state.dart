import 'package:list_app/src/features/data/models/character_model.dart';
import 'package:list_app/src/features/data/models/location_model.dart';

abstract class ListState {}

class ListLoading extends ListState {}

class ListCharactersLoaded extends ListState {
  final List<CharacterModel> characters;

  ListCharactersLoaded(this.characters);
}

class ListLocationsLoaded extends ListState {
  final List<LocationModel> locations;

  ListLocationsLoaded(this.locations);
}

class ListError extends ListState {
  final String errorMessage;

  ListError(this.errorMessage);
}
