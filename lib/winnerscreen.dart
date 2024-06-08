import 'package:flutter/material.dart';
class WinnerScreen extends StatelessWidget {
  static const String id="WinnerScreen";

   const WinnerScreen({Key? key, required }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final arguments=ModalRoute.of(context)!.settings.arguments as Map;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(arguments['mine']>arguments['robot']?"${"You Win The Game by Scoring ${arguments['mine']} "} Points ":""
              "${"You Loose The Game Bcz Cpu Score ${arguments['robot']}"} Points",
            style:const TextStyle(
            color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 20
          ),textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
  FloatingActionButton(onPressed: ()
      {
Navigator.pop(context);

      },
    backgroundColor: Colors.pinkAccent,

    child: const Icon(Icons.restart_alt,color: Colors.white,size: 20,)

          )
        ],
      ),
    );
  }
}
