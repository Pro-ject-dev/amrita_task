import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/pokemon_bloc_bloc.dart';
import 'package:pokemon/utils/colors.dart';
import 'package:pokemon/widgets/homewidgets/error_widget.dart';
import 'package:pokemon/widgets/homewidgets/listview_card.dart';
import 'package:pokemon/widgets/homewidgets/loading_widget.dart';
import '../widgets/homewidgets/grid_list_card.dart';

class PokemonHomePage extends StatefulWidget {
  const PokemonHomePage({super.key});

  @override
  State<PokemonHomePage> createState() => _PokemonHomePageState();
}

class _PokemonHomePageState extends State<PokemonHomePage>
    with SingleTickerProviderStateMixin {
  bool isGridView = true;
  int offset = 0;
  final int limit = 10;
  int _currentPage = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PokemonBloc>(context)
        .add(GetPokemonsEvent(offset: offset, limit: limit));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadNextPage() {
    _isLoading = true;
    _currentPage++;
    offset = (_currentPage - 1) * limit;
    BlocProvider.of<PokemonBloc>(context)
        .add(GetPokemonsEvent(offset: offset, limit: limit));
  }

  void toggleView() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: appbar(),
      body: BlocBuilder<PokemonBloc, PokemonBlocState>(
        bloc: BlocProvider.of<PokemonBloc>(context),
        builder: (context, state) {
          if (state is GetPokemonLoadingState) {
            return Loading.loadingWidget();
          } else if (state is GetPokemonErrorState) {
            return ErroruiWidget.errorwidget(state, context);
          } else if (state is GetPokemonSuccessState) {
            _isLoading = false;
            final pokemons = state.pokemons.results ?? [];
            return Column(
              children: [
                Expanded(
                  child: isGridView
                      ? GridListCard.buildGridView(pokemons, offset, limit)
                      : ListviewCard.buildListView(pokemons, offset, limit),
                ),
                buildPaginationControls(state),
              ],
            );
          }
          return Loading.loadingWidget();
        },
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primaryColor,
      foregroundColor: appBarforeColor,
      title: Row(
        children: [
          Text(
            "Pokemon Task",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            isGridView ? Icons.grid_view_rounded : Icons.view_list_rounded,
            color: appBarforeColor,
            size: 24,
          ),
          onPressed: toggleView,
        )
      ],
    );
  }

  Widget buildPaginationControls(PokemonBlocState state) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: cardcolor,
        boxShadow: [
          BoxShadow(
            color: appBarforeColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: _currentPage > 1
                ? () {
                    setState(() {
                      _currentPage--;
                      offset = (_currentPage - 1) * limit;
                    });
                    BlocProvider.of<PokemonBloc>(context).add(
                      GetPokemonsEvent(offset: offset, limit: limit),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: appBarforeColor,
              foregroundColor: primaryColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: _currentPage > 1
                      ? primaryColor
                      : disabledcolor.withOpacity(0.3),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                  color: _currentPage > 1 ? primaryColor : disabledcolor,
                ),
                const SizedBox(width: 4),
                Text(
                  "Previous",
                  style: TextStyle(
                    fontSize: 14,
                    color: _currentPage > 1 ? primaryColor : disabledcolor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Page $_currentPage",
              style: TextStyle(
                color: primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _isLoading ? null : loadNextPage,
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: appBarforeColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Next 10",
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
