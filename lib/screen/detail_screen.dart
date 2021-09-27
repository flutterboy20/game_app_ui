import 'package:flutter/material.dart';

import 'package:game_app/model/player_info.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = 'detail-screen';
  final PlayerInfo playerInfo;
  const DetailScreen({
    Key? key,
    required this.playerInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Container _buildRecommedGames(
      String imgUrl,
    ) {
      return Container(
        margin: const EdgeInsets.only(left: 10),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 140,
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(playerInfo.name),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 130,
                      child: Image.asset(
                        playerInfo.imageUrl,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 140,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Download',
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 140,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Play',
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.lightGreen.shade500,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(playerInfo.description,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text('Ratings  ' + playerInfo.rating.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text('Similar Games',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700)),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    'View All',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    _buildRecommedGames(
                      'assets/images/assassin_creed.png',
                    ),
                    _buildRecommedGames(
                      'assets/images/pubg.jpg',
                    ),
                    _buildRecommedGames(
                      'assets/images/nfs.png',
                    ),
                    _buildRecommedGames(
                      'assets/images/cod.png',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
