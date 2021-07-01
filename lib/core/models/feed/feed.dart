class Feed {
  Feed({
    this.uid,
    this.id,
    this.feedId,
    this.link,
    this.title,
    this.imgUrl,
    this.description,
    this.category,
    this.fullName,
    this.profileImg,
    this.timeStamp,
    this.isUpdated = false,
  });

  final String uid;
  final String id;
  final String feedId;
  final String link;
  final String title;
  final String imgUrl;
  final String description;
  final String category;
  final String fullName;
  final String profileImg;
  final String timeStamp;
  final bool isUpdated;

  Feed copyWith({
    String uid,
    String id,
    String feedId,
    String link,
    String title,
    String imgUrl,
    String description,
    String category,
    String fullName,
    bool isUpdated,
    String profileImg,
    String timeStamp,
  }) =>
      Feed(
        uid: uid ?? this.uid,
        id: id ?? this.id,
        feedId: feedId ?? this.feedId,
        isUpdated: isUpdated ?? this.isUpdated,
        link: link ?? this.link,
        title: title ?? this.title,
        imgUrl: imgUrl ?? this.imgUrl,
        description: description ?? this.description,
        category: category ?? this.category,
        fullName: fullName ?? this.fullName,
        profileImg: profileImg ?? this.profileImg,
        timeStamp: timeStamp ?? this.timeStamp,
      );

  factory Feed.fromMap(Map<String, dynamic> json, String id) => Feed(
        uid: json["uid"] == null ? null : json["uid"],
        id: id,
        feedId: json["feedId"] == null ? null : json["feedId"],
        link: json["link"] == null ? null : json["link"],
        isUpdated: json["isUpdated"] == null ? false : json["isUpdated"],
        title: json["title"] == null ? null : json["title"],
        imgUrl: json["imgUrl"] == null ? null : json["imgUrl"],
        description: json["description"] == null ? null : json["description"],
        category: json["category"] == null ? null : json["category"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        profileImg: json["profileImg"] == null ? null : json["profileImg"],
        timeStamp: json["timeStamp"] == null ? null : json["timeStamp"],
      );

  Map<String, dynamic> toMap() => {
        "uid": uid == null ? null : uid,
        "id": id == null ? null : id,
        "feedId": feedId == null ? null : feedId,
        "link": link == null ? null : link,
        "title": title == null ? null : title,
        "isUpdated": isUpdated == null ? false : isUpdated,
        "imgUrl": imgUrl == null ? null : imgUrl,
        "description": description == null ? null : description,
        "category": category == null ? null : category,
        "fullName": fullName == null ? null : fullName,
        "profileImg": profileImg == null ? null : profileImg,
        "timeStamp": timeStamp == null ? null : timeStamp,
      };
}
