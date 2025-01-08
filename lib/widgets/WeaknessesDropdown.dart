import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/pokemon_card.dart';

class WeaknessesDropdown extends StatefulWidget {
  final List<Resistance> weaknesses;

  const WeaknessesDropdown({Key? key, required this.weaknesses}) : super(key: key);

  @override
  _WeaknessesDropdownState createState() => _WeaknessesDropdownState();
}

class _WeaknessesDropdownState extends State<WeaknessesDropdown> {
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
            _cardDetailTitle("Weaknesses"), // Title on the left
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
        if (_isExpanded) ...widget.weaknesses.map((weakness) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
            child: Text(
              "• ${weakness.type}: ${weakness!.value}",
              style: TextStyle(color: Colors.grey[700]),
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
