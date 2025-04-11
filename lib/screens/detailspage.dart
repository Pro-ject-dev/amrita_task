import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';
import 'package:pokemon/blocs/pokemon_bloc_bloc.dart';
import 'package:pokemon/models/pokemonDetailsModel.dart';
import 'package:pokemon/utils/colors.dart';
import 'package:pokemon/widgets/detailswidgets/ability_widget.dart';
import 'package:pokemon/widgets/detailswidgets/buildsection.dart';
import 'package:pokemon/widgets/detailswidgets/chipcard.dart';
import 'package:pokemon/widgets/detailswidgets/moves_widget.dart';
import 'package:pokemon/widgets/detailswidgets/typechip_widget.dart';
import 'package:pokemon/widgets/homewidgets/loading_widget.dart';

class PokemonDetailScreen extends StatefulWidget {
  final String pokemonName;
  final String image;
  final int offset;
  final int limit;
  const PokemonDetailScreen(
      {super.key,
      required this.pokemonName,
      required this.image,
      required this.offset,
      required this.limit});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<PokemonBloc>(context)
        .add(GetPokemonsDetailsEvent(name: widget.pokemonName));
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
    onWillPop: () async {
      BlocProvider.of<PokemonBloc>(context).add(
        GetPokemonsEvent(offset: widget.offset, limit: widget.limit),
      );
      return true;
    },
    child: Scaffold(
      backgroundColor: scaffoldColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: cardcolor.withOpacity(0.7),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: textandiconColor),
                onPressed: () {
                  Navigator.pop(context);
                  BlocProvider.of<PokemonBloc>(context).add(
                    GetPokemonsEvent(
                        offset: widget.offset, limit: widget.limit),
                  );
                },
              ),
            ),
          )),
      body:
          BlocBuilder<PokemonBloc, PokemonBlocState>(builder: (context, state) {
        if (state is GetPokemonDetailsLoadingState) {
          return Loading.loadingWidget();
        } else if (state is GetPokemonDetailsSuccessState) {
          final pokemon = state.pokemonDetails;
          return builddetails(pokemon, context);
        } else {
          return Container();
        }
      }),
    ));
  }

  Stack builddetails(PokemonDetailsModel pokemon, BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                primaryColor.withOpacity(0.8),
                primaryColor.withOpacity(0.2),
              ],
            ),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pokemon.name.toString().toUpperCase(),
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: cardcolor,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black26,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Row(
                    children: (pokemon.types)!.map((type) {
                      final typeName = type.type!.name.toString();
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: TypeChip(typeName: typeName),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    height: 220,
                    width: 220,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cardcolor.withOpacity(0.3),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.contain,
                      scale: 0.7,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: cardcolor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Base Experience
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 30, 24, 20),
                        child: Row(
                          children: [
                            Cards.ChipCard(
                              context,
                              'Base EXP',
                              pokemon.baseExperience.toString(),
                              Icons.flash_on,
                              primaryColor,
                            ),
                            const SizedBox(width: 16),
                            Cards.ChipCard(
                              context,
                              'Height',
                              '${pokemon.height} m',
                              Icons.height,
                              primaryColor,
                            ),
                            const SizedBox(width: 16),
                            Cards.ChipCard(
                              context,
                              'Weight',
                              '${pokemon.weight} kg',
                              Icons.monitor_weight_outlined,
                              primaryColor,
                            ),
                          ],
                        ),
                      ),

                      BuildSection.buildSection(
                        context,
                        'Abilities',
                        Icons.auto_awesome,
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: pokemon.abilities!.length,
                          itemBuilder: (context, index) {
                            final ability = pokemon
                                .abilities![index].ability!.name
                                .toString();
                            return AbilityTile(
                              abilityName: ability,
                              primaryColor: primaryColor,
                              index: index,
                            );
                          },
                        ),
                      ),

                      BuildSection.buildSection(
                        context,
                        'Moves',
                        Icons.sports_martial_arts,
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount:pokemon.moves!.length > 5 ? 5:pokemon.moves!.length,
                          itemBuilder: (context, index) {
                            final move =
                                pokemon.moves![index].move!.name.toString();
                            return MoveTile(
                              moveName: move,
                              primaryColor: primaryColor,
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
