class Feed {
  final String fullName;
  final String uid;
  final String feedId;
  final String title;
  final String description;
  final String link;
  final String category;
  final String timeStamp;
  final String profileImg;

  Feed(
      {this.fullName,
      this.uid,
      this.feedId,
      this.title,
      this.description,
      this.link,
      this.timeStamp,
      this.category,
      this.profileImg});

  Feed.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        feedId = data['feedId'],
        link = data['link'],
        fullName = data['fullName'],
        profileImg = data['profileImg'],
        title = data['title'],
        description = data['description'],
        timeStamp = data['timeStamp'],
        category = data['category'];

  Map<String, String> toJson() {
    return {
      "uid": uid,
      "feedId": feedId,
      "link": link,
      "title": title,
      "description": description,
      "category": category,
      "fullName": fullName,
      "profileImg": profileImg,
      "timeStamp": timeStamp,
    };
  }
}
