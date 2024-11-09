class User {
  String? title;
  String? body;
  int? id;
  int? userId;

  User({
    this.body,
    this.title,
    this.id,
    this.userId,
  });

  //json decoder factory constructor
  factory User.fromJson(Map<String, dynamic> json) => User(
        title: json['title'],
        body: json['body'],
        userId: json['userId'],
        id: json['id'],
      );

// convert to json
  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "userId": userId,
        "id": id,
      };
}
