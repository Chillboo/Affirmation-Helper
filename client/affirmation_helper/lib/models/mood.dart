
class Mood {
  int range;
  DateTime timeCreated;
  String userID;

  Mood({
    required this.range,
    required this.timeCreated,
    required this.userID,
  });

  factory Mood.fromJson(Map<String, dynamic> json) {
    return Mood(
      range: json["range"],
      timeCreated: json["timeCreated"],
      userID: json["userID"],
    );
  }

  factory Mood.newMood(int range, DateTime timeCreated, String userID) {
    return Mood(
      range: range,
      timeCreated: timeCreated,
      userID: userID,
    );
  }

  Map<String, dynamic> toJson() => {
        'range': range,
        'timeCreated': timeCreated,
        'userID': userID,
      };
}