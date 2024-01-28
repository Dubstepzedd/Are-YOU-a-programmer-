import 'package:flutter/material.dart';
import 'package:quiz_programmer/widgets/centered_view/centered_view.dart';
import 'package:quiz_programmer/widgets/cards/option_card.dart';
import 'package:quiz_programmer/views/game/modes/local/host_view.dart';
import 'package:quiz_programmer/views/game/modes/local/join_view.dart';
import 'package:quiz_programmer/widgets/navigation_bar/navigation_bar.dart';

class OptionView extends StatelessWidget {

  const OptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
       body: Column(children: <Widget>[
        CustomNavigationBar(),
        SizedBox(height: 50),
        Text("JOIN OR HOST?",
          style: 
            TextStyle(
              fontWeight: FontWeight.w800, 
              height: 0.9,
              fontSize: 50,
            )
          ),
          SizedBox(height: 100),
          CenteredView(child: 
            Row(children: <Widget>[
              Expanded(child: OptionCard("HOST", Icons.person, HostView())),
              Expanded(child: SizedBox(width: 100)),
              Expanded(child: OptionCard("JOIN", Icons.connect_without_contact, JoinView())),
            ])
          )
       ])
      );
  } 
}