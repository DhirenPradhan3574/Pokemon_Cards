import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/pokemon_card.dart';

class AttacksDropdown extends StatefulWidget {
  final List<Attack> attacks;

  const AttacksDropdown({Key? key, required this.attacks}) : super(key: key);

  @override
  _AttacksDropdownState createState() => _AttacksDropdownState();
}

class _AttacksDropdownState extends State<AttacksDropdown> {
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Attacks",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
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

        // List of Attacks (Shown only when expanded)
        if (_isExpanded) ...widget.attacks.map((attack) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0, left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "• ${attack.name} (${attack.damage} Damage)",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Cost: ${attack.cost!.join(', ')}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Text(
                  "Description: ${attack.text}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
