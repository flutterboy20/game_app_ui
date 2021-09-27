import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:game_app/model/player_info.dart';
import 'package:game_app/screen/detail_screen.dart';

const double itemWidth = 140.0;
const double itemHeight = 200.0;
const double horizontalItemMargin = 4.0;

class PlayerItem extends StatefulWidget {
  @override
  State<PlayerItem> createState() => _PlayerItemState();
}

class _PlayerItemState extends State<PlayerItem> {
  @override
  void initState() {
    super.initState();
    loadPlayerData();
  }

  List bgColor = [Colors.cyan, Colors.amber, Colors.red.shade600];

  Future<String> _loadJson() async {
    return await rootBundle.loadString('assets/json/player_info.json');
  }

  Future loadPlayerData() async {
    String jsonString = await _loadJson();
    final jsonResponse = json.decode(jsonString);
    Player data = Player.fromJson(jsonResponse);
    setState(() {
      playerData = data;
    });
  }

  var playerData;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 0.4,
        initialPage: 0,
        reverse: false,
        autoPlay: false,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        disableCenter: true,
      ),
      itemCount: playerData.allItems.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        final players = playerData.allItems[itemIndex];
        return GestureDetector(
          onTap: () => Navigator.push(
            (context),
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                playerInfo: players,
              ),
            ),
          ),
          child: SizedBox(
            width: itemWidth,
            height: itemHeight,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/images/playersBackground.png',
                    color: bgColor[itemIndex],
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 46.0, left: 20),
                    child: Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    Image.asset(
                      playerData.allItems[itemIndex].imageUrl,
                      width: itemWidth * 0.85,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            playerData.allItems[itemIndex].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  playerData.allItems[itemIndex].description,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              margin: const EdgeInsets.only(right: 20),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Center(
                                child: Text(
                                  playerData.allItems[itemIndex].rating
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
