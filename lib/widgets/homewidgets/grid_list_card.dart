import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/pokemon_bloc_bloc.dart';
import 'package:pokemon/screens/detailspage.dart';
import 'package:pokemon/utils/colors.dart';
import 'package:pokemon/utils/constants.dart';
import 'package:pokemon/utils/methods.dart';

class GridListCard {
  static   Widget buildGridView(List<dynamic> pokemons,int offset,int limit) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];
        final pokemonId = getPokemonId(pokemon.url ?? "");
        final color = getRandomColor(int.parse(pokemonId));
        
        return GestureDetector(
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
).then((_) {
 
      BlocProvider.of<PokemonBloc>(context).add(
        GetPokemonsEvent(offset: offset, limit: limit),
      );
});


          },
          child: Container(
            decoration: BoxDecoration(
              color: appBarforeColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Text(
                            "#${pokemonId.padLeft(3, '0')}",
                            style: TextStyle(
                              color: color.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Center(
                          child: Hero(
                            tag: "pokemon-$pokemonId",
                            child: Image.network(
                              "$imgurl/$pokemonId.png",
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.catching_pokemon,
                                  size: 60,
                                  color: color.withOpacity(0.5),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      formatPokemonName(pokemon.name ?? ""),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: disabledcolor[800],
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}