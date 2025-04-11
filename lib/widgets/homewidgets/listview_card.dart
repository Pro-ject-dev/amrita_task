import 'package:flutter/material.dart';
import 'package:pokemon/utils/colors.dart';
import 'package:pokemon/utils/constants.dart';
import 'package:pokemon/utils/methods.dart';
import '../../screens/detailspage.dart';

class ListviewCard {
  static buildListView(List<dynamic> pokemons, int offset, int limit) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];
        final pokemonId = getPokemonId(pokemon.url ?? "");
        final color = getRandomColor(int.parse(pokemonId));

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: appBarforeColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: disabledcolor.withOpacity(0.15),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Hero(
                tag: "pokemon-$pokemonId",
                child: Image.network(
                  "$imgurl/$pokemonId.png",
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.catching_pokemon,
                      size: 30,
                      color: color.withOpacity(0.5),
                    );
                  },
                ),
              ),
            ),
            title: Text(
              formatPokemonName(pokemon.name ?? ""),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              "#${pokemonId.padLeft(3, '0')}",
              style: TextStyle(
                color: disabledcolor[600],
                fontSize: 14,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: disabledcolor[400],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonDetailScreen(
                    pokemonName: pokemons[index].name,
                    image: "$imgurl/$pokemonId.png",
                    offset: offset,
                    limit: limit,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
