
import 'package:flutter/material.dart';

class HomeDetails extends StatelessWidget {

  const HomeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("ARE YOU A PROGRAMMER?",
          style: 
            TextStyle(
              fontWeight: FontWeight.w800, 
              height: 0.9,
              fontSize: 70
            )
          ),
          SizedBox(height: 30),
          Text("Do you want to test your programming knowledge? \nTry our game 'Are you a programmer?' today!",
          style: TextStyle(fontSize: 21, height: 1.3))
        ],
      ),
    );
  }
}