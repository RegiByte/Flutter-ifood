class Highlight {
  final String title;
  final String tip;
  final String picture;

  Highlight({this.title, this.tip, this.picture});

  factory Highlight.fromJson(jsonData) {
    return Highlight(
      title: jsonData['title'],
      tip: jsonData['tip'],
      picture: jsonData['picture'],
    );
  }
}
