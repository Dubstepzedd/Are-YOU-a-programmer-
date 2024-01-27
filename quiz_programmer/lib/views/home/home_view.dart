import "package:flutter/material.dart";
import 'package:quiz_programmer/views/game/options_view.dart';
import "package:quiz_programmer/widgets/centered_view/centered_view.dart";
import "package:quiz_programmer/widgets/details/details.dart";
import "package:quiz_programmer/widgets/navigation_bar/navigation_bar.dart";

class HomeView extends StatelessWidget {

    const HomeView({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            const CustomNavigationBar(),
            const SizedBox(height: 100),
            CenteredView(child:
              Row(children: [
                const HomeDetails(),
                Expanded(child: Center(
                  child: TextButton(
                    onPressed: () => {  Navigator.push(context, MaterialPageRoute(builder: (context) => const OptionView())) },
                     child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: const Text("Try now!", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white, fontSize: 18))
                    
                     ))))
                ] 
              )
            )
          ]
        )
      );
    }
}