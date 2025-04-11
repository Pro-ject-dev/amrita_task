import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/pokemon_bloc_bloc.dart';
import 'package:pokemon/utils/colors.dart';

class ErroruiWidget {
  static  errorwidget(GetPokemonErrorState state, BuildContext context) {
    return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 60, color: primaryColor),
                const SizedBox(height: 16),
                Text(
                  "Oops! ${state.error}",
                  style: TextStyle(
                    color: disabledcolor[800],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<PokemonBloc>(context).add(
                      GetPokemonsEvent(offset: 0, limit: 10),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: appBarforeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text("Try Again"),
                ),
              ],
            ),
          );
  }
}