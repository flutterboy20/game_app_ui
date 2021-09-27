class Player {
  final List<PlayerInfo> allItems;

  Player({required this.allItems});

  factory Player.fromJson(List<dynamic> parsedJson) {
    List<PlayerInfo> all = <PlayerInfo>[];
    all = parsedJson.map((i) => PlayerInfo.fromJson(i)).toList();

    return Player(
      allItems: all,
    );
  }
}

class PlayerInfo {
  PlayerInfo(
      {required this.imageUrl,
      required this.name,
      required this.description,
      required this.rating});
  String imageUrl;
  String name;
  String description;
  double rating;

  factory PlayerInfo.fromJson(Map<String, dynamic> json) => PlayerInfo(
        imageUrl: json["imageUrl"],
        name: json["name"],
        description: json["description"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    data['description'] = description;
    data['rating'] = rating;
    return data;
  }
}
