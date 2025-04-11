part of 'pokemon_bloc_bloc.dart';

@immutable
abstract class PokemonBlocState {}

class PokemonBlocInitial extends PokemonBlocState {}

class GetPokemonSuccessState extends PokemonBlocState {
  final PokemonModel pokemons;
  GetPokemonSuccessState({required this.pokemons});
}

class GetPokemonDetailsSuccessState extends PokemonBlocState {
  final PokemonDetailsModel pokemonDetails;
  GetPokemonDetailsSuccessState({required this.pokemonDetails});
}

class GetPokemonLoadingState extends PokemonBlocState {}
class GetPokemonDetailsLoadingState extends PokemonBlocState {}
class GetPokemonErrorState extends PokemonBlocState {
  final String error;
  GetPokemonErrorState({required this.error});
}
class GetPokemonDetailsErrorState extends PokemonBlocState {
  final String error;
  GetPokemonDetailsErrorState({required this.error});
}