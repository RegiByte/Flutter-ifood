class Category {
  final String name;
  final String picture;

  Category({this.name, this.picture});

  factory Category.fromJson(jsonData) {
    return Category(
      name: jsonData['name'],
      picture: jsonData['picture'],
    );
  }
}
