import "package:flutter/material.dart";
import 'package:quiz_programmer/views/about/about_view.dart';
import 'package:quiz_programmer/views/game/options_view.dart';
import "package:quiz_programmer/views/home/home_view.dart";
import 'package:stroke_text/stroke_text.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )]

      ),
      height: 80,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            
            child: StrokeText(
              text: "are you a programmer?",
              textStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w800,
                fontSize: 25,
              ),
              strokeColor: Colors.black,
              strokeWidth: 4,
            )
          ),
          Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              NavBarItem("Home", HomeView()),
              SizedBox(width: 60),
              NavBarItem("About", AboutView()),
              SizedBox(width: 60),
              NavBarItem("Try now", OptionView()),
              SizedBox(width: 60)
            ]),
          ])
    );
  }
}


class NavBarItem extends StatelessWidget {
  final String title;
  final Widget view;

  void onPressed(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => view));
  }

  const NavBarItem(this.title, this.view, {super.key});

  @override
  Widget build(BuildContext context) {
     return TextButton( 
      onPressed: () {
        onPressed(context);
      },
      child: Text(title, style: const TextStyle(fontSize: 18, color: Colors.black))
    );
    
  }
}