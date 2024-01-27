import 'package:flutter/material.dart';
import 'package:quiz_programmer/widgets/navigation_bar/navigation_bar.dart';

class OptionView extends StatelessWidget {

  const OptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
       body: Column(children: <Widget>[
        CustomNavigationBar()
       ])
      );
  } 
}