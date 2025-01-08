import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon_card.dart';

class ApiService {
  static const String baseUrl = 'https://api.pokemontcg.io/v2/cards';

  Future<List<Datum>> fetchCards(int page,String query) async {

        String url = '$baseUrl?page=$page&pageSize=10';
        // String query = "pikachu";
    if (query.isNotEmpty) {
      url = '$baseUrl?q=name:$query';
    }

        print("url $url");

    // final response = await http.get(Uri.parse('$baseUrl?page=$page&pageSize=10'));
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];

      return data.map((e) => Datum.fromMap(e)).toList();
    } else {
      throw Exception("Failed to load Pokémon cards");
    }
  }
}



// now dhiren

// class ApiService {
//   static const String baseUrl = 'https://api.pokemontcg.io/v2/cards';
//
//   Future<List<Datum>> fetchCards(int page, String query) async {
//     String url = '$baseUrl?page=$page&pageSize=10';
//
//     if (query.isNotEmpty) {
//       url = '$baseUrl?q=name:$query';
//     }
//
//     print("url $url");
//     final response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       print("Response: ${response.body}"); // Debugging print
//       final Map<String, dynamic> jsonResponse = json.decode(response.body);
//       final List<dynamic> data = jsonResponse['data']; // Extract 'data' list
//
//       return data.map((e) => Datum.fromMap(e)).toList(); // Convert to Datum list
//     } else {
//       print("Error: ${response.statusCode} - ${response.body}"); // Debugging print
//       throw Exception("Failed to load Pokémon cards");
//     }
//   }
// }


