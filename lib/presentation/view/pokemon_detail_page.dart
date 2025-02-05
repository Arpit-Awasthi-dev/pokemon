import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/core/utils/app_bar.dart';
import 'package:pokemon/models/pokemon/pokemon.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({super.key});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late final Pokemon _pokemon;

  @override
  void initState() {
    super.initState();
    _pokemon = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _rootUI(),
    );
  }

  Widget _rootUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _viewImage(),
            const SizedBox(height: 12),
            _viewGeneralInfo(),
            const SizedBox(height: 12),
            _viewSetInfo(),
            const SizedBox(height: 12),
            _viewAttackInfo(),
            const SizedBox(height: 12),
            _viewMoreInfo(),
            const SizedBox(height: 12),
            _viewPrices(),
          ],
        ),
      ),
    );
  }

  Widget _viewImage() {
    return Hero(
      tag: _pokemon.id,
      child: CachedNetworkImage(
        width: double.infinity,
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
        imageUrl: _pokemon.images.small,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget _viewGeneralInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _pokemon.name,
          style: context.textTheme.bodyLarge!
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'HP: ${_pokemon.hp}',
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Text(
          'Supertype: ${_pokemon.supertype}',
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Text(
          'Subtypes: ${_pokemon.subtypes.first}',
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _viewSetInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Set: ${_pokemon.set.name} (${_pokemon.set.releaseDate})',
          style: context.textTheme.bodyLarge!
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        CachedNetworkImage(
          width: 24,
          height: 24,
          alignment: Alignment.topCenter,
          imageUrl: _pokemon.set.logo,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        const SizedBox(height: 4),
        Text(
          'Series: ${_pokemon.set.series}',
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _viewAttackInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attacks:',
          style: context.textTheme.bodyLarge!
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _pokemon.attacks.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _pokemon.attacks[index].name,
                    style: context.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Cost: ${_pokemon.attacks[index].cost.join(', ')}',
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Damage: ${_pokemon.attacks[index].damage}',
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Effect: ${_pokemon.attacks[index].text}',
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _viewMoreInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_pokemon.weaknesses.isNotEmpty)
          Text(
            'Weaknesses: ${_pokemon.weaknesses.first.type} (x${_pokemon.weaknesses.first.value})',
            style: context.textTheme.bodyMedium,
          ),
        if (_pokemon.resistances.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              'Resistances: ${_pokemon.resistances.first.type} (x${_pokemon.resistances.first.value})',
              style: context.textTheme.bodyMedium,
            ),
          ),
        const SizedBox(height: 4),
        Text(
          'Retreat Cost: ${_pokemon.retreatCost.join(', ')}',
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: 12),
        Text(
          'Artist: ${_pokemon.artist}',
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Text(
          'Rarity: ${_pokemon.rarity}',
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Text(
          'Flavor Text: ${_pokemon.flavorText}',
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _viewPrices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Prices (TCGPlayer)',
          style: context.textTheme.bodyLarge!
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'Low: ${_pokemon.tcgplayer?.prices.holofoil?.low}',
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Text(
          'Mid: ${_pokemon.tcgplayer?.prices.holofoil?.mid}',
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Text(
          'High: ${_pokemon.tcgplayer?.prices.holofoil?.high}',
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: 12),
        Text(
          'Prices (CardMarket)',
          style: context.textTheme.bodyLarge!
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'Average sell price: ${_pokemon.cardmarket.averageSellPrice}',
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Text(
          'Trend price: ${_pokemon.cardmarket.trendPrice}',
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBarWidget(title: _pokemon.name);
  }
}
