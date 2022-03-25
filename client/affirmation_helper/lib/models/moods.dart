import 'package:affirmation_helper/models/mood.dart';
import 'package:flutter/cupertino.dart';

class Moods extends ChangeNotifier{
  List<Mood> moods = [];

  Moods();

  void addMood(Mood mood) {
    moods.add(mood);
    notifyListeners();
  }

  void replaceMoods(List<Mood> moodsList) {
    moods = moodsList;
    notifyListeners();
  }

  void removeMood(Mood mood) {
    moods.remove(mood);
  }
}
