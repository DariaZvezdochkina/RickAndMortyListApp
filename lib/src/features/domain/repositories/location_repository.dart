import 'package:list_app/src/features/data/datasources/api_service.dart';

import '../../data/models/location_model.dart';
import '../../data/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final ApiService apiService;

  LocationRepositoryImpl({required this.apiService});

  @override
  Future<List<LocationModel>> fetchLocations() async {
    try {
      final List<dynamic> data = await apiService.fetchLocations();
      final List<LocationModel> locations = data
          .map((item) => LocationModel(id: item['id'], name: item['name'], type: item['type']))
          .toList();
      return locations;
    } catch (e) {
      throw Exception('Failed to fetch characters: $e');
    }
  }
}
