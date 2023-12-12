import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/providers/question_index_provider.dart';
import 'package:quizz/providers/score_counter_provider.dart';
import 'package:quizz/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScoreCounterProvider()),
        ChangeNotifierProvider(create: (context) => QuestionIndexProvider())
      ],
      child: MaterialApp(
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        title: 'Quizz',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(),
        home: const MyHomePage(title: 'Quiz home page'),
      ),
    );
  }
}
