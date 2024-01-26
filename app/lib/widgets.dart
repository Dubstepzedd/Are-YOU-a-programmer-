import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double size;

  const MyButton(this.text, this.icon, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(12.0),
        child: Row(
          children: [
            Container(
              height: size,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Icon(
                icon,
                color: Colors.white
              )
            ),
            Expanded(
              child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )
            ))
           
          ])
        )
    );
  }
}