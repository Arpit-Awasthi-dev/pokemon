import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/core/navigation/named_routes.dart';
import 'package:pokemon/core/utils/api_status.dart';
import 'package:pokemon/models/pokemon/pokemon.dart';
import 'package:pokemon/models/pokemon/pokemon_list.dart';
import 'package:pokemon/presentation/view_models/pokemon_list_page_view_model.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/app_bar.dart';
import '../../core/utils/error_widget.dart';
import '../../core/utils/status_widget.dart';
import '../../localization/locale_keys.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final PokemonListPageViewModel _viewModel = PokemonListPageViewModel();
  final _scrollController = ScrollController();
  int _page = 1;
  String? _query;

  void _getPokemonList() {
    _viewModel.getPokemonList(_page, _query);
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _page++;
        _getPokemonList();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getPokemonList();
    _scrollController.addListener(() => _scrollListener());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Obx(() {
        switch (_viewModel.requestStatus.value) {
          case ApiStatus.success:
            if (_viewModel.pokemonList.list.isEmpty) {
              return const CustomErrorWidget(error: 'No results');
            }
            return _rootUI(_viewModel.pokemonList);

          default:
            return StatusWidget(
              status: _viewModel.requestStatus.value,
              error: _viewModel.error.value,
            );
        }
      }),
    );
  }

  Widget _rootUI(PokemonList pokemons) {
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(12),
      itemCount: pokemons.hasNextPage
          ? pokemons.list.length + 2
          : pokemons.list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of items per row
        crossAxisSpacing: 12, // Space between columns
        mainAxisSpacing: 12, // Space between rows
      ),
      itemBuilder: (_, index) {
        if (index >= pokemons.list.length) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightDivider),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const CupertinoActivityIndicator(),
          );
        }
        return _item(pokemons.list[index]);
      },
    );
  }

  Widget _item(Pokemon pokemon) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(NamedRoutes.pokemonDetailPage, arguments: pokemon);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.pokemonCard,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Hero(
                tag: pokemon.id,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  imageUrl: pokemon.images.small,
                  placeholder: (_, __) {
                    return const SizedBox(
                      height: 32,
                      width: 32,
                      child: CupertinoActivityIndicator(),
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                pokemon.name,
                style: context.textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appbar() {
    return AppBarWidget(
      title: Obx(() {
        return _viewModel.showAppSearchField.value
            ? _appBarTextField()
            : _appBarTitle();
      }),
      actions: [
        Obx(() {
          if (_viewModel.showAppSearchField.value) {
            return GestureDetector(
              onTap: () {
                _page = 1;
                _query = null;
                _getPokemonList();
                _viewModel.changeAppSearchFieldVisibility(false);
              },
              child: const Icon(
                Icons.close,
                size: 20,
                color: Colors.black54,
              ),
            );
          } else {
            return GestureDetector(
              onTap: () {
                _viewModel.changeAppSearchFieldVisibility(true);
              },
              child: const Icon(
                Icons.search,
                size: 20,
                color: Colors.black54,
              ),
            );
          }
        }),
        const SizedBox(width: 12),
      ],
    );
  }

  Widget _appBarTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: SizedBox(
        height: 36,
        child: TextField(
          autofocus: true,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black54,
              size: 20,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.white,
            isDense: false,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onSubmitted: (String text) {
            _page = 1;
            _query = text;
            _getPokemonList();
          },
        ),
      ),
    );
  }

  Widget _appBarTitle() {
    return Text(
      Localized.pokemon.tr,
      style: context.textTheme.titleLarge!.copyWith(
        color: Colors.black,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
