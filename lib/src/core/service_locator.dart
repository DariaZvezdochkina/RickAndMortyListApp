import 'package:get_it/get_it.dart';
import 'package:list_app/src/features/data/datasources/api_service.dart';

import '../features/data/repositories/character_repository.dart';
import '../features/data/repositories/location_repository.dart';
import '../features/domain/repositories/character_repository.dart';
import '../features/domain/repositories/location_repository.dart';
import '../features/presentation/bloc/cubit/list_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(apiService: getIt<ApiService>()));
  getIt.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImpl(apiService: getIt<ApiService>()));

  getIt.registerFactory<ListCubit>(() => ListCubit(
        characterRepository: getIt<CharacterRepository>(),
        locationRepository: getIt<LocationRepository>(),
      ));

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(),
  );
}
