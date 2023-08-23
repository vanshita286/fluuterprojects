class NewsModel {
  // v ke andar value hobhi skti he aur nahi bhi
  // String? v;
  // late means value hogi lekin abhi nahi future mein
  // these variables will be late initialised
  // late String b;

  // one benefit of late over null ? operator is that if in fuure the value of ? operator is null the bang operator will blast unconditionally whereas we can check for null and take alternatives pathways with late types
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;
  late Sources src;

  NewsModel(
      {required this.author,
      required this.content,
      required this.description,
      required this.publishedAt,
      required this.title,
      required this.url,
      required this.urlToImage});

  NewsModel.extractJSON(Map<String, dynamic> json) {
    src = Sources.extractJSON(json["source"]);
    // this is where a null operator would have blasted while late operator allowed us to follow different pathway
    author = json["author"] ?? "not available";
    content = json["content"] ?? "not available";
    description = json["description"] ?? "not available";
    title = json["title"] ?? "not available";
    publishedAt = json["publishedAt"] ?? "not available";
    url = json["url"] ?? "not available";
    urlToImage = json["urlToImage"] ??
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRe4CWmbFwHoZTchJBcZgZntqP0NL4lrcy-MU6gSAU&s";
  }
}

class Sources {
  late String id;
  late String name;

  Sources({required this.id, required this.name});

  Sources.extractJSON(Map<String, dynamic> json) {
    id = json["id"] ?? "not available";
    name = json["name"] ?? "not available";
  }
}
