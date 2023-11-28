import 'package:flutter/material.dart';

class QuestionIndexProvider with ChangeNotifier {
  int questionIndex;

  QuestionIndexProvider({this.questionIndex = 1});

  void incrementQuestionIndex() {
    questionIndex++;
    notifyListeners();
  }

  void initQuestionIndex() {
    questionIndex = 0;
    notifyListeners();
  }
}
