import 'package:flutter/material.dart';
import 'package:quiz_programmer/widgets/centered_view/centered_view.dart';
import 'package:quiz_programmer/widgets/navigation_bar/navigation_bar.dart';

class Score extends StatelessWidget {
  final Map<String, int> score;

  const Score(this.score, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
        const CustomNavigationBar(),
        const SizedBox(height: 40),
        const Text(
          "Results:",
            style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w800,
          )
        ),
        CenteredView(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)
                ),
                child: Row(children: [
                  const Spacer(),
                  Text("${score.keys.elementAt(index)}: ",
                    style: const TextStyle(
                      color: Colors.black, 
                      fontWeight: FontWeight.w800,
                      fontSize: 25
                    )
                   ),
                   Center(
                     child: Text("${score.values.elementAt(index)} points",
                      style: const TextStyle(
                        color: Colors.black, 
                        fontWeight: FontWeight.w800,
                        fontSize: 25
                      )
                     ),
                   ),
                   const Spacer()
                    
                ]),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: score.length),
        )
      ])
    );
  }
}