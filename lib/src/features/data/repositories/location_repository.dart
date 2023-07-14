import 'package:list_app/src/features/data/models/location_model.dart';

abstract class LocationRepository {
  Future<List<LocationModel>> fetchLocations();
}
