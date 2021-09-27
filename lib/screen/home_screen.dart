import 'package:flutter/material.dart';
import 'package:game_app/widgets/players_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Hi Elon',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(height: 5),
                          Text('Welcome Back!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)),
                        ],
                      )),
                  const SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text('ExploreGames',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
              Container(
                height: 180,
                margin: EdgeInsets.only(right: 20),
                child: Image.asset('assets/images/ninja.png'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Recently released',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                              )),
                          SizedBox(height: 5),
                          Text('Popular Games',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      )),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 10,
                  bottom: 8,
                ),
                child: const Text('View All',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    )),
              ),
            ],
          ),
          PlayerItem(),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Recommeded Games',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    )),
                Text('View All',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    )),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  _buildRecommedGames(
                    'assets/images/nfs.png',
                  ),
                  _buildRecommedGames(
                    'assets/images/assassin_creed.png',
                  ),
                  _buildRecommedGames(
                    'assets/images/pubg.jpg',
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
    ));
  }

  Container _buildRecommedGames(
    String imgUrl,
  ) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: itemWidth,
            height: itemHeight,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
