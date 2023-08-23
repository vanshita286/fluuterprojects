class YTModel {
  late String id;
  late Snippet snippet;

  late ContentDetails contentDetails;
  late Statistics statistics;

  YTModel({
    required this.id,
  });

  YTModel.extractData(Map<String, dynamic> map) {
    id = map["id"] ?? "NA";
    snippet = Snippet.extractData(map["snippet"]);
    contentDetails = ContentDetails.extractData(map["contentDetails"]);
    statistics = Statistics.extractData(map["statistics"]);
  }
}

class Snippet {
  late String publishedAt;
  late String title;
  late String description;
  late Thumbnails thumbnail;
  late String channelTitle;
  late List<dynamic> tags;

  Snippet({
    required this.description,
    required this.publishedAt,
    required this.title,
    required this.channelTitle,
    required this.tags,
  });

  Snippet.extractData(Map<String, dynamic> map) {
    channelTitle = map["channelTitle"] ?? "NA";
    tags = map["tags"] ?? [];
    thumbnail = Thumbnails.extractData(map["thumbnails"]);
    publishedAt = map["publishedAt"] ?? "NA";
    description = map["description"] ?? "NA";
    title = map["title"] ?? "NA";
  }
}

class Thumbnails {
  late String thumbnail;

  Thumbnails({
    required this.thumbnail,
  });

  Thumbnails.extractData(Map<String, dynamic> map) {
    thumbnail = map["maxres"]["url"] ??
        map["standard"]["url"] ??
        "https://th.bing.com/th/id/OIP.LTjBkNrD3LB5C9_t_8chKQHaHa?pid=ImgDet&w=185&h=185&c=7&dpr=1.6";
  }
}

class ContentDetails {
  late String duration;
  late String definition;
  late bool licensedContent;

  ContentDetails({
    required this.definition,
    required this.duration,
    required this.licensedContent,
  });

  ContentDetails.extractData(Map<String, dynamic> map) {
    definition = map["definition"] ?? "NA";
    duration = map["duration"] ?? "NA";
    licensedContent = map["licensedContent"] ?? "NA";
  }
}

class Statistics {
  late String viewCount;
  late String likeCount;
  late String commentCount;
  late String favouriteCount;

  Statistics({
    required this.commentCount,
    required this.favouriteCount,
    required this.likeCount,
    required this.viewCount,
  });

  Statistics.extractData(Map<String, dynamic> map) {
    likeCount = map["likeCount"] ?? "NA";
    commentCount = map["commentCount"] ?? "NA";
    favouriteCount = map["favouriteCount"] ?? "NA";
    viewCount = map["viewCount"] ?? "NA";
  }
}
