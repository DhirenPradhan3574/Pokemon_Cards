import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/pokemon_card.dart';
import '../providers/pokemon_provider.dart';
import '../widgets/PokemonCardWidget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  int currentPage = 1;
  String searchQuery = '';
  Timer? _debounce;

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(milliseconds: 3000), () {
      setState(() {
        searchQuery = query;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final pokemonList = ref.watch(pokemonProvider(currentPage));
    final searchList = ref.watch(searchQueryProvider);

    //now dhiren
    // final pokemonList = ref.watch(pokemonProvider({'page': currentPage, 'query': searchQuery}));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Pokémon Cards",style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal:12.0),
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(6.0),
              child: SizedBox(
                height: 45, // Set the height you want for the TextField
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    isDense: true, // Helps to make the input area smaller
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade600, size: 18), // Smaller icon size
                    hintText: 'Search Pokemon',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 12,fontFamily: "Poppins"),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0), // Minimized padding
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(color: Colors.indigoAccent, width: 1.5),
                    ),
                  ),
                  style: const TextStyle(fontSize: 12,fontFamily: "Poppins"),
                  onChanged: (query){
                    if (_debounce?.isActive ?? false) _debounce!.cancel();
                    _debounce = Timer(Duration(milliseconds: 3000), () {
                      setState(() {
                        ref.read(searchQueryProvider.notifier).state = query;
                        searchQuery = query;
                        currentPage = 1;
                      });
                    });
                  },// Smaller font size
                  // onChanged: _onSearchChanged,
                ),
              ),
            ),
          ),
          Expanded(
            child:
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              child:
              // pokemonList.when(
              //   data: (data)
              //   {
              //     final filteredPokemon = data.where((pokemon) =>
              //         pokemon.name!.toLowerCase().contains(_searchController.text.toLowerCase())
              //     ).toList();
              //
              //     return GridView.builder(
              //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         childAspectRatio: 0.8,
              //       ),
              //       itemCount: filteredPokemon.length,
              //       itemBuilder: (context, index) {
              //         return PokemonCardWidget(pokemon: filteredPokemon[index]);
              //       },
              //     );
              //   },
              //   loading: () => Center(child: CircularProgressIndicator()),
              //   error: (error, _) => Center(child: Text("Error loading data")),
              // ),

              pokemonList.when(
                data: (data) => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return PokemonCardWidget(pokemon: data[index]);
                  },
                ),
                loading: () => Center(child: CircularProgressIndicator()),
                error: (error, _) => Center(child: Text("Error loading data")),
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: currentPage > 1
                      ? () {
                    setState(() {
                      currentPage--;
                    });
                  }
                      : null,
                  child: Text("Previous"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentPage++;
                    });
                  },
                  child: Text("Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





