import 'dart:convert';

import 'package:flowershop/models/flower.dart';

import 'package:flutter/foundation.dart'; //nodig voor de kIsWeb
import 'package:http/http.dart' as http;
import 'package:flowershop/data/fallbackflowers.dart';

class FlowerApiService {
  final String apiKey = 'usr-OVVgsV0ghbH_S8D_iwAQyKZqtqOOR9z5Hu2RCR-L43Q';
  final List<String> zoekTermen = [
    'dahlia pinnata',
    'dahlia arabian night',
    'dahlia black jack',
    'dahlia karma choc',
    'zantedeschia aethiopica',
    'zantedeschia black star',
    'zantedeschia odessa',
    'zantedeschia schwarzwalder',
    'rosa black baccara',
    'rosa black magic',
    'rosa grand prix',
    'rosa piano',
    'rosa damascena',
    'rosa gallica',
    'paeonia red charm',
    'paeonia black beauty',
    'paeonia buckeye belle',
    'anemone coronaria',
    'ranunculus asiaticus',
    'ranunculus black pearl',
    'tulipa queen of night',
    'tulipa black hero',
    'tulipa continental',
    'tulipa uncle tom',
    'scabiosa atropurpurea',
    'scabiosa black knight',
    'cosmos atrosanguineus',
    'amaranthus caudatus',
    'amaranthus cruentus',
    'astrantia major',
    'astrantia roma',
    'helleborus orientalis',
    'helleborus niger',
    'eryngium planum',
    'eryngium giganteum',
    'allium atropurpureum',
    'allium giganteum',
    'gladiolus black surprise',
    'gladiolus communis',
    'cymbidium orchid',
    'phalaenopsis orchid',
    'cymbidium burgundy',
    'fritillaria persica',
    'fritillaria meleagris',
    'lilium candidum',
    'lilium asiatic',
    'lilium orientalis',
    'dianthus caryophyllus',
    'dianthus black jack',
    'chrysanthemum morifolium',
    'chrysanthemum dark bronze',
    'eustoma grandiflorum',
    'lisianthus black pearl',
    'iris germanica',
    'iris black gamecock',
    'delphinium elatum',
    'hydrangea macrophylla',
    'papaver somniferum',
  ];

  Future<List<Flower>> fetchFlowers() async {
    await Future.delayed(Duration(seconds: 4));
    if (kIsWeb) {
      return fallbackflowers;
    }

    final List<Flower> zoekResultaat = [];

    for (final term in zoekTermen) {
      try {
        final url = Uri.parse(
          'https://trefle.io/api/v1/plants/search?token=$apiKey&q=$term',
        );

        final response = await http.get(url);

        if (response.statusCode == 200) {
          final json = jsonDecode(response.body);
          final List flowersJson = json['data'];

          print('Gezocht op term: $term');
          print('Aantal planten gevonden: ${flowersJson.length}');

          final flowers = flowersJson
              .map((flowerJson) => Flower.fromJson(flowerJson))
              .where(
                (flower) =>
                    flower.scientificName.toLowerCase() ==
                    term.toLowerCase(), //zoek op exacte term
              )
              .toList();

          zoekResultaat.addAll(flowers);
        }
      } catch (e) {
        print('Fout bij zoekterm "$term": $e');
      }
    }

    if (zoekResultaat.isEmpty) {
      return fallbackflowers;
    }
    //haal de dubbels eruit voor het returnen van de resultaten
    final uniekeBloemen = <int, Flower>{};

    for (final flower in zoekResultaat) {
      uniekeBloemen[flower.id] = flower;
    }

    return uniekeBloemen.values.toList();
  }
}
