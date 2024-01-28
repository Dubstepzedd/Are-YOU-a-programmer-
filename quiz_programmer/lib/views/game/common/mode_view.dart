import 'package:flutter/material.dart';
import 'package:quiz_programmer/views/game/modes/local/options_view.dart';
import 'package:quiz_programmer/widgets/centered_view/centered_view.dart';
import 'package:quiz_programmer/widgets/cards/option_card.dart';
import 'package:quiz_programmer/views/game/modes/party/lobby_view.dart';
import 'package:quiz_programmer/widgets/navigation_bar/navigation_bar.dart';

class ModeView extends StatelessWidget {

  const ModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
       body: Column(children: <Widget>[
        CustomNavigationBar(),
        SizedBox(height: 50),
        Text("WHAT MODE?",
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
              Expanded(child: OptionCard("PARTY", Icons.group, LobbyView())),
              Expanded(child: SizedBox(width: 100)),
              Expanded(child: OptionCard("LOCAL", Icons.wifi, OptionView())),
            ])
          )
       ])
      );
  } 
}