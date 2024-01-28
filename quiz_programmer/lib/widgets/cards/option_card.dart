import 'package:flutter/material.dart';
import 'package:quiz_programmer/helpers/transitions.dart';

class OptionCard extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Widget view;

  const OptionCard(this.text, this.iconData,this.view, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
      onTap: (){
        Navigator.push(context, createRouteFade(view, 200));
      },
      child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4,4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Icon(iconData, size: 100),
          const SizedBox(height: 10),
          Text(text, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25)),
          const SizedBox(height: 10)
        ]
      ),


    )
   );
  }
}