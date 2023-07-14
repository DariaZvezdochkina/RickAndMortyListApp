import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_app/src/features/data/models/location_model.dart';
import '../../../data/models/character_model.dart';
import '../../../data/repositories/character_repository.dart';
import '../../../data/repositories/location_repository.dart';
import '../state/list_state.dart';

class ListCubit extends Cubit<ListState> {
  final CharacterRepository characterRepository;
  final LocationRepository locationRepository;

  ListCubit({
    required this.characterRepository,
    required this.locationRepository,
  }) : super(ListLoading());

  Future<void> fetchCharacters() async {
    emit(ListLoading());

    try {
      final List<CharacterModel> characters = await characterRepository.fetchCharacters();
      emit(ListCharactersLoaded(characters));
    } catch (e) {
      emit(ListError('Failed to fetch characters'));
    }
  }

  Future<void> fetchLocations() async {
    emit(ListLoading());

    try {
      final List<LocationModel> locations = await locationRepository.fetchLocations();
      emit(ListLocationsLoaded(locations));
    } catch (e) {
      emit(ListError('Failed to fetch locations'));
    }
  }
}
