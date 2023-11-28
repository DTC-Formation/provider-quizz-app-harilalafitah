import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/providers/question_index_provider.dart';
import 'package:quizz/providers/score_counter_provider.dart';
import 'package:quizz/screen/quizz_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Quizz',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Start quiz!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const QuestionPage()));
                  context.read<ScoreCounterProvider>().clearScore();
                  context.read<QuestionIndexProvider>().initalQuestionIndex();
                },
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size.fromWidth(180)),
                  elevation: MaterialStatePropertyAll(4),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  overlayColor: MaterialStatePropertyAll(Colors.lightBlue),
                ),
                child: const Text('Start'),
              ),
              const SizedBox(height: 20),
              Text(
                'Score : ${context.watch<ScoreCounterProvider>().score.toString()}',
                style: const TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
