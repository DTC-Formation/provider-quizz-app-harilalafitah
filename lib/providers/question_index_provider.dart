import 'package:flutter/material.dart';

class QuestionIndexProvider with ChangeNotifier {
  int questionIndex;

  QuestionIndexProvider({this.questionIndex = 1});

  void incrementQuestionIndex() {
    questionIndex++;
    notifyListeners();
  }

  void initalQuestionIndex() {
    questionIndex = 0;
    notifyListeners();
  }
}
