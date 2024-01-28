
import 'package:flutter/material.dart';
import 'package:quiz_programmer/widgets/centered_view/centered_view.dart';
import 'package:quiz_programmer/widgets/navigation_bar/navigation_bar.dart';

class AboutView extends StatelessWidget {

  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
       body: Column(children: <Widget>[
        CustomNavigationBar(),
        CenteredView(
          child: Column(
            children: [ 
            Text(
                "ABOUT",
                  style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                )
              ),
              SizedBox(height: 25),
              Text(
                """Welcome to 'Are you a programmer?', where programming prowess meets competitive fun! Dive into the world of coding challenges and put your programming skills to the test in a thrilling quiz format. 'Are you a programmer?' is the ultimate destination for programmers looking to sharpen their coding knowledge and have a blast while doing it. Whether you're a seasoned developer or just starting out on your coding journey, there's something for everyone in our game. Challenge yourself in solo mode, where you can tackle a variety of coding questions across different languages and difficulty levels. Test your skills against a diverse range of programming concepts, from basic syntax to advanced algorithms. But why stop there? Take the competition to the next level with our multiplayer modes. In "Party" mode, gather your friends around a single device and engage in a battle of wits as you race to answer coding questions and claim victory. Or, if you prefer a bit more elbow room, connect with fellow players on the same network in "Local" mode and compete head-to-head for coding supremacy. With 'Are you a programmer?', the excitement never ends. Stay tuned for regular updates with fresh challenges, new features, and more ways to prove you're the ultimate coding champion. Are you ready to test your mettle and emerge victorious in the world of programming trivia? Join us now and let the coding games begin!""",
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                )
              ),
            ]
          ),
        )
       ])
      );
  } 
}