import 'package:flutter/material.dart';
import 'optionpage.dart';

void main() {
  runApp(
    MaterialApp(
      home: const HomePage(), 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "MontserratBold"
      )
    )
  );
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: <Widget>[
                  Image.asset("images/placeholder.png"),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey,
                      textStyle: const TextStyle(
                        color: Colors.black,
                      ) 
                    ),
                    onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OptionPage()));
                    
                    },
                    child: const Text('Start')
                  )
                ]
              )
            ),
          ]
        )          
        ),
      );
  }
}
