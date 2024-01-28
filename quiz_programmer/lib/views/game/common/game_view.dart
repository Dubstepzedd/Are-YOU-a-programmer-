import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_programmer/widgets/cards/question_card.dart';
import 'package:quiz_programmer/widgets/score/score.dart';

class GameView extends StatefulWidget {
  final List<String> names;
  final Map<String, int> results;
  const GameView(this.names,this.results,{Key? key}) : super(key: key);

  @override
  State<GameView> createState() {
    return _GameState();
  }

}

class _GameState extends State<GameView> {

  Future<Map> readJson() async {
    final String response = await rootBundle.loadString("assets/json/questions.json");
    final Map data = await json.decode(response);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    if(widget.names.isNotEmpty) {
      return FutureBuilder(
        future: readJson(), // returns a Map with the stored values
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final map = snapshot.data! as Map<String, dynamic>;
            return QuestionCard(map, widget.names,widget.results);
          } else {
            return const Center(child: CircularProgressIndicator()); // or an indicator that no data is stored
          }
        }
      );
    }
    else {
      return Score(widget.results);
    }

  }
}