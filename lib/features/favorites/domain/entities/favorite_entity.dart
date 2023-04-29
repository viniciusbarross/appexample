class Favorite {
  final String url;

  Favorite(this.url);

  Favorite.fromJson(Map<String, dynamic> json) : url = json["url"];

  Map<String, dynamic> toJson() => {'url': url};
}
