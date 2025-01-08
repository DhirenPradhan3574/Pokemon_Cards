import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_card/widgets/AbilityDropDown.dart';

import '../models/pokemon_card.dart';
import '../widgets/AttacksDropdown.dart';
import '../widgets/WeaknessesDropdown.dart';

class DetailScreen extends StatefulWidget {
  final Datum pokemon;

  DetailScreen({required this.pokemon});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>  with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );


    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pokemon.name ?? 'Unknown',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: "1",
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: CachedNetworkImage(
                    imageUrl: widget.pokemon.images?.small ?? '',
                    height: 200,
                    width: 260,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _cardDetailTitle("Basic Details"),
                  _cardDetailRow("Name", widget.pokemon.name ?? ''),
                  _cardDetailRow(
                      "Types", widget.pokemon.types?.join(', ') ?? ''),
                  _cardDetailRow("Hp", widget.pokemon.hp ?? ''),
                  _cardDetailRow("Artist", widget.pokemon.artist ?? ''),
                  _cardDetailRow("Set", widget.pokemon.datumSet!.name ?? ''),
                  const Divider(),
                  AttacksDropdown(attacks: widget.pokemon.attacks ?? []),
                  const Divider(),
                  WeaknessesDropdown(
                      weaknesses: widget.pokemon.weaknesses ?? []),
                  const Divider(),
                  AbilityDropdown(ability: widget.pokemon.abilities ?? [])
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
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

  Widget _cardDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
