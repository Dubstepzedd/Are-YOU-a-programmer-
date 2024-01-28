import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_programmer/views/game/common/game_view.dart';
import 'package:quiz_programmer/widgets/centered_view/centered_view.dart';
import 'package:quiz_programmer/widgets/navigation_bar/navigation_bar.dart';

class QuestionCard extends StatefulWidget {
  final int maxQuestions = 1;
  final Map data;
  String name = "Unknown";
  final Map<String, int> results;
  final List<String> names;
  int score = 0;
  List<Answer> checked = [];
  int questionIndex = -1;
  int questionsAnswered = 0;

  QuestionCard(this.data, this.names,this.results, {Key? key}) : super(key: key);

  @override
  State<QuestionCard> createState() => QuestionCardState();
}


class QuestionCardState extends State<QuestionCard> {
  Color myColor = Colors.white;

  void checkAnswer() {
  List<dynamic> answers = widget.checked.map((e) => e.text).toList();

  if (widget.questionIndex != -1) {
    bool isEqual = listEquals(
        answers, widget.data["questions"][widget.questionIndex]["correct"]);
    
    setState(() {
      myColor = isEqual ? Colors.green : Colors.red;
    });

    widget.score += isEqual ? 1 : 0;
    
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        myColor = Colors.white;
        bool switchUser = reset();
        if (switchUser) {
          Map<String, int> results = {widget.name : widget.score};
          results.addAll(widget.results);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => GameView(widget.names, results)),
          );
        }
      });
    });
  }
}

  bool reset() {
    
    for (Answer check in widget.checked) {
      check.isChecked = false;
    }

    // Questions first.
    if (widget.questionIndex != -1) {
      
      widget.data["questions"].removeAt(widget.questionIndex);
      widget.questionsAnswered+=1;
    }
    
    
    if(widget.questionsAnswered >=  widget.maxQuestions) {
      dispose();
      return true;
    }

    var rand = Random();
    widget.questionIndex = rand.nextInt(widget.data["questions"].length);

    widget.checked.clear();

    return false;
   
  }
  @override
  void initState() {
    super.initState();
    widget.name = widget.names[0];
    widget.names.removeAt(0);
    reset();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.data["questions"].isEmpty || widget.questionIndex == -1) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()), backgroundColor: Colors.white);
    }

    return Scaffold(
      body: 
      Column(
        children: [
          const CustomNavigationBar(),
          CenteredView(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: myColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 5,
                    blurRadius: 10
                  )
                ]
              ),
              child: Column(
                children: [
                  Text(
                    "${widget.name}'s turn", 
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.underline
                    )
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Question:",
                     style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    )
                  ),
                  Text(
                    widget.data["questions"][widget.questionIndex]["question"],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    )
                  ),
                  const SizedBox(height: 20),
                  ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    shrinkWrap: true,
                    itemCount:  widget.data["questions"][widget.questionIndex]["answers"].length,
                    itemBuilder: 
                    (context, index) {
                      return Answer(widget.data["questions"][widget.questionIndex]["answers"][index], widget.checked);
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 20)
                    
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      if (widget.checked.isNotEmpty) {
                          checkAnswer();
                      }
                    },
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("Submit", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),)
                      ),
                    ),
                  ),
                  const SizedBox(height: 25)
                ],
              )
            ),
          )
        ]
      )
    );
      
  }
}

class Answer extends StatefulWidget {
  final String text;
  Color myColor = Colors.white;
  bool? isChecked = false;
  final List<Answer> checked;

  Answer(this.text, this.checked,  {super.key});

  @override
  State<Answer> createState() => _CheckBoxState();

}

class _CheckBoxState extends State<Answer> {
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
        decoration: BoxDecoration(
          color: widget.myColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black)
        ),
        child: CheckboxListTile(
          title: Text(widget.text),
          
          value: widget.isChecked,
          onChanged: (bool? value) {
            setState(() {
              widget.isChecked = value;

              if (value == true) {
                widget.checked.add(widget);
              }
              else if(value == false && widget.checked.contains(widget)) {
                widget.checked.remove(widget);
              }
              
            });
          }
        )
    );
  }
}