class Question {
  final String topic;
  final String questionText;
  final List<Answer> answersList;

  Question(this.topic, this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestion() {
  List<Question> questionsData = [];

  questionsData.add(
    Question(
      'Science',
      'Which planet is known as the "Red Planet"?',
      [
        Answer('a) Venus', false),
        Answer('b) Mars', true),
        Answer('c) Jupiter', false),
        Answer('d) Saturn', false),
      ],
    ),
  );

  questionsData.add(
    Question(
      'Literature',
      'Who wrote the play "Romeo and Juliet"?',
      [
        Answer('a) Charles Dickens', false),
        Answer('b) William Shakespeare', true),
        Answer('c) Jane Austen', false),
        Answer('d) F. Scott Fitzgerald', false),
      ],
    ),
  );

  questionsData.add(
    Question(
      'Geography',
      'What is the capital city of Japan?',
      [
        Answer('a) Beijing', false),
        Answer('b) Tokyo', true),
        Answer('c) Seoul', false),
        Answer('d) Bangkok', false),
      ],
    ),
  );

  questionsData.add(
    Question(
      'History',
      'In which year did Christopher Columbus first reach the Americas?',
      [
        Answer('a) 1492', true),
        Answer('b) 1588', false),
        Answer('c) 1620', false),
        Answer('d) 1776', false),
      ],
    ),
  );

  questionsData.add(
    Question(
      'Technology',
      'Which programming language is commonly used for building web applications?',
      [
        Answer('a) Java', false),
        Answer('b) Python', false),
        Answer('c) Ruby', false),
        Answer('d) JavaScript', true),
      ],
    ),
  );
  return questionsData;
}
