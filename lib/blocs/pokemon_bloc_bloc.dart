import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/models/pokemonDetailsModel.dart';
import 'package:pokemon/models/pokemonModels.dart';

import '../repos/pokemon_repository.dart';

part 'pokemon_bloc_event.dart';
part 'pokemon_bloc_state.dart';

class PokemonBloc extends Bloc<PokemonBlocEvent, PokemonBlocState> {
  PokemonBloc() : super(PokemonBlocInitial()) {
    on<GetPokemonsEvent>(getPokemonsEvent); 
    on<GetPokemonsDetailsEvent>(getPokemonsDetailsEvent);
  }

  FutureOr<void> getPokemonsEvent(GetPokemonsEvent event, Emitter<PokemonBlocState> emit) async {
    try {
      emit(GetPokemonLoadingState());
      final PokemonModel pokemons = await PokemonRepository().getPokemons(event.limit.toString(), event.offset.toString());
      emit(GetPokemonSuccessState(pokemons: pokemons));
    }
    catch (e) {
      emit(GetPokemonErrorState(error: e.toString()));
    }
  }

  FutureOr<void> getPokemonsDetailsEvent(GetPokemonsDetailsEvent event, Emitter<PokemonBlocState> emit)  async{
    try {
      emit(GetPokemonDetailsLoadingState());
      final PokemonDetailsModel pokemonDetails = await PokemonRepository().getPokemonDetails(event.name);
      emit(GetPokemonDetailsSuccessState(pokemonDetails: pokemonDetails));
    }
    catch (e) {
      emit(GetPokemonDetailsErrorState(error: e.toString()));
    }
  }
}
