import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/utils/colors.dart';
import 'blocs/pokemon_bloc_bloc.dart';
import 'screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PokemonBloc()),
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme),
          primaryColor: primaryColor
        ),
        home: PokemonHomePage(),
        
      ),
    );
  }
}
