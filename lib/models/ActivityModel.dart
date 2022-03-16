class ActivityModel {
  String name;
  String thumbnail;
  int price;
  int people;
  int ratings;
  String description;
  String location;

  ActivityModel({
    required this.name,
    required this.thumbnail,
    required this.price,
    required this.people,
    required this.ratings,
    required this.description,
    required this.location,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      name: json["name"],
      thumbnail: json["thumbnail"],
      price: json["price"],
      people: json["people"],
      ratings: json["ratings"],
      description: json["description"],
      location: json["location"],
    );
  }
}
