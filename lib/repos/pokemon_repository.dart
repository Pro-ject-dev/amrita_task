
import 'dart:convert';

import 'package:pokemon/models/pokemonDetailsModel.dart';
import 'package:pokemon/models/pokemonModels.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/utils/constants.dart';

class PokemonRepository {
  Future<PokemonModel> getPokemons(String limit , String offset) async {
  final  response  = await http.get(Uri.parse('$baseurl?limit=${limit}&offset=${offset}'));
  if (response.statusCode == 200) {
    final Map<String, dynamic> pokemons = jsonDecode(response.body);
    return PokemonModel.fromJson(pokemons);
  } else {
    throw Exception('Failed to load pokemons');
  }
}

  Future<PokemonDetailsModel> getPokemonDetails(String name) async {
    final response = await http.get(Uri.parse('$baseurl/$name'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> pokemonDetails = jsonDecode(response.body);
      return PokemonDetailsModel.fromJson(pokemonDetails);
    } else {
      throw Exception('Failed to load pokemon details');
    }
  }
}