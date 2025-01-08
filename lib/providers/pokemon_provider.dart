import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/pokemon_card.dart';
import '../services/ApiService.dart';


// ApiService Provider
final apiServiceProvider = Provider((ref) => ApiService());
// Search Query Provider
final searchQueryProvider = StateProvider<String>((ref) => '');


// Pokémon List Provider
// final pokemonProvider = FutureProvider.family<List<Datum>, int>((ref, page) async {
//   final apiService = ref.read(apiServiceProvider);
//   return apiService.fetchCards(page);
// });


final pokemonProvider = FutureProvider.family<List<Datum>, int>((ref, page) async {
  final apiService = ref.read(apiServiceProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  return apiService.fetchCards(page,searchQuery);
});






