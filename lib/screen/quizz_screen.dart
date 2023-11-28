import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/Models/model_question.dart';
import 'package:quizz/providers/question_index_provider.dart';
import 'package:quizz/providers/score_counter_provider.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Question> questionsList = getQuestion();
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          title: Text(
            questionsList[context.watch<QuestionIndexProvider>().questionIndex]
                .topic,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _questionWidget(),
            Card(
              color: Colors.black54,
              child: SizedBox(
                width: size.width,
                child: _answerList(),
              ),
            ),
            _nextButton(),
          ],
        ),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Question ${(context.watch<QuestionIndexProvider>().questionIndex + 1).toString()} /${questionsList.length.toString()}',
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          color: Colors.blue,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                questionsList[
                        context.watch<QuestionIndexProvider>().questionIndex]
                    .questionText,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children:
          questionsList[context.watch<QuestionIndexProvider>().questionIndex]
              .answersList
              .map((ans) => _answerButton(ans))
              .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: ElevatedButton(
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              context.read<ScoreCounterProvider>().incrementScore();
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 50),
          shape: const StadiumBorder(),
          backgroundColor: isSelected ? Colors.blue : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.blue,
        ),
        child: Text(answer.answerText),
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (context.watch<QuestionIndexProvider>().questionIndex ==
        questionsList.length - 1) {
      isLastQuestion = true;
    }
    return ElevatedButton(
      onPressed: () {
        if (isLastQuestion) {
          showDialog(context: context, builder: (scr) => _showScore());
        } else {
          setState(() {
            selectedAnswer = null;
            context.read<QuestionIndexProvider>().incrementQuestionIndex();
          });
        }
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(150, 20),
        shape: const StadiumBorder(),
      ),
      child: Text(isLastQuestion ? 'Submit' : 'Next'),
    );
  }

  _showScore() {
    return AlertDialog(
      title: Text(
          'Total score : ${context.watch<ScoreCounterProvider>().score.toString()}/${questionsList.length}'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).popUntil(ModalRoute.withName("/"));
          },
          child: const Text('Finish'),
        )
      ],
    );
  }
}
