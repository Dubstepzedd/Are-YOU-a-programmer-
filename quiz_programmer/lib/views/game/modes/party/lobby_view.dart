
import 'package:flutter/material.dart';
import 'package:quiz_programmer/helpers/transitions.dart';
import 'package:quiz_programmer/views/game/common/game_view.dart';
import 'package:quiz_programmer/widgets/centered_view/centered_view.dart';
import 'package:quiz_programmer/widgets/navigation_bar/navigation_bar.dart';


class LobbyView extends StatefulWidget {


  const LobbyView({Key? key}) : super(key: key);

  @override
  State<LobbyView> createState() => _FormState();
 
}


class _FormState extends State<LobbyView> {
  List<TextEditingController> listController = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomNavigationBar(),
              const SizedBox(height: 50),
              const CenteredView(
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Text(
                    "ADD PLAYERS",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 50
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CenteredView(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  shrinkWrap: true,
                  itemCount: listController.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)
                              ),
                              child: TextFormField(
                                controller: listController[index],
                                autofocus: false,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Input player's name here",
                                  hintStyle: TextStyle(
                                      color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          index > 0
                              ? GestureDetector(
                                onTap: (){
                                  setState(() {
                                    listController[index].clear();
                                    listController[index].dispose();
                                    listController.removeAt(index);
                                  });
                                },
                                child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 35,
                                  ),
                              )
                              : const SizedBox()
                        ],
                      ),
                    );
                  },
                ),
              ),             
              GestureDetector(
                onTap: () {
                  setState(() {
                    listController.add(TextEditingController());
                  });
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text("Add More Players", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),)
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    List<String> names = listController.map((e) => e.text).toList();
                    List<String> not_empty = names.where((element) => !element.isEmpty).toList();

                    if (not_empty.isNotEmpty && not_empty.length == names.length) {
                      Navigator.push(context,createRouteFade(GameView(names, const {}), 200));
                    }
                  });
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text("Submit", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),)
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
    );
  }
}