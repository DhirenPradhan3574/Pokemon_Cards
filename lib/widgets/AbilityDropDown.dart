import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/pokemon_card.dart';

class AbilityDropdown extends StatefulWidget {
  final List<Ability> ability;

  const AbilityDropdown({Key? key, required this.ability}) : super(key: key);

  @override
  _AbilityDropdownState createState() => _AbilityDropdownState();
}

class _AbilityDropdownState extends State<AbilityDropdown> {
  bool _isExpanded = false; // Controls visibility of the list

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Row with Dropdown Button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _cardDetailTitle("Abilities"), // Title on the left
            IconButton(
              icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ],
        ),

        // List of Weaknesses (Shown only when expanded)
        if (_isExpanded) ...widget.ability.map((ability) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${ability.name}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Text(
                  "Type: ${ability.type}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Text(
                  "Text: ${ability.text}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _cardDetailTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
    );
  }

}
