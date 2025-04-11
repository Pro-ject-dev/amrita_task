part of 'pokemon_bloc_bloc.dart';

@immutable
abstract class PokemonBlocEvent {}

class GetPokemonsEvent extends PokemonBlocEvent {
  final int offset;
  final int limit;
  GetPokemonsEvent({required this.offset, required this.limit});
}
class GetPokemonsDetailsEvent extends PokemonBlocEvent {
  final String name;
  GetPokemonsDetailsEvent({required this.name});
}
