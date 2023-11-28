import 'package:flutter/material.dart';

class ScoreCounterProvider with ChangeNotifier {
  int score;

  ScoreCounterProvider({this.score = 0});

  void incrementScore() {
    score++;
    notifyListeners();
  }

  void clearScore() {
    score = 0;
    notifyListeners();
  }
}
