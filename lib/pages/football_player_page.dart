// ignore_for_file: unnecessary_underscores

import 'package:flutter/material.dart';
import 'package:app_ehibah/widgets/football_player_widget.dart';

class FootballPlayerPage extends StatefulWidget {
  const FootballPlayerPage({super.key});

  @override
  State<FootballPlayerPage> createState() => _FootballPlayerPageState();
}

class _FootballPlayerPageState extends State<FootballPlayerPage> {
  final footballPlayers = [
    {
      "name": "Lionel Messi",
      "country": "Argentina",
      "imageUrl":
          "https://hips.hearstapps.com/hmg-prod/images/lionel-messi-celebrates-after-their-sides-third-goal-by-news-photo-1686170172.jpg?crop=0.66653xw:1xh;center,top&resize=640:*",
    },
    {
      "name": "Cristiano Ronaldo",
      "country": "Portugal",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Cristiano_Ronaldo_playing_for_Al_Nassr_FC_against_Persepolis%2C_September_2023_%28cropped%29.jpg/500px-Cristiano_Ronaldo_playing_for_Al_Nassr_FC_against_Persepolis%2C_September_2023_%28cropped%29.jpg",
    },
    {"name": "Neymar Jr.", "country": "Brazil", "imageUrl": null},
    {"name": "Kylian Mbappé", "country": "France", "imageUrl": null},
    {"name": "Kevin De Bruyne", "country": "Belgium", "imageUrl": null},
    {"name": "Robert Lewandowski", "country": "Poland", "imageUrl": null},
    {"name": "Virgil van Dijk", "country": "Netherlands", "imageUrl": null},
    {
      "name": "Rizky Ridho R",
      "country": "Indonesia",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/4/48/Rizky_Ridho_-_53615135042.jpg",
    },
    {"name": "Marcelino Ferdinan", "country": "Indonesia", "imageUrl": null},
  ];

  final favoritePlayers = <String>{};

  void toggleFavorite(String playerName) {
    setState(() {
      if (favoritePlayers.contains(playerName)) {
        favoritePlayers.remove(playerName);
      } else {
        favoritePlayers.add(playerName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Football Player Page')),
      body: ListView.separated(
        padding: EdgeInsets.all(16.0),
        itemCount: footballPlayers.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (_, index) => FootballPlayerWidget(
          name: footballPlayers[index]['name']!,
          country: footballPlayers[index]['country']!,
          imageUrl: footballPlayers[index]['imageUrl'],
          isFavorite: favoritePlayers.contains(footballPlayers[index]['name']!),
          onTap: () => toggleFavorite(footballPlayers[index]['name']!),
        ),
      ),
    );
  }
}
