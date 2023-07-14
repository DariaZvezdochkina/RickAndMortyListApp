import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = 'https://rickandmortyapi.com/api';

  Future<List<dynamic>> fetchCharacters() async {
    final response = await http.get(Uri.parse('$apiUrl/character'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> characters = data['results'];
      return characters;
    } else {
      throw Exception('Failed to fetch characters');
    }
  }

  Future<List<dynamic>> fetchLocations() async {
    final response = await http.get(Uri.parse('$apiUrl/location'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> characters = data['results'];
      return characters;
    } else {
      throw Exception('Failed to fetch locations');
    }
  }
}
