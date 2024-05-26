import 'dart:convert';

// List<TaksModel> taskFromJson(String str) {
//   final Iterable<dynamic> parsed = json.decode(str);
//   return List<TaksModel>.from(parsed.map((x) => TaksModel.fromJson(x)));
// }


//String taskToJson(List<TaksModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    String id;
    String userId;
    String title;
    String description;

    UserModel({
        required this.id,
        required this.userId,
        required this.title,
        required this.description,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "description": description,
    };
}