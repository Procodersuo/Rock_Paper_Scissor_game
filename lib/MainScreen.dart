import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rock_ppr_szr/winnerscreen.dart';
class MainScreen extends StatefulWidget {
  static const String id='MainScreen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int myScr=0,robotScore=0;
  String myPic='1',cpuPic='1',pointShower="",myPIC1="";
  var random =Random();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.pinkAccent,
                  Colors.pink,
                ])),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your score : $myScr",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Robot score : $robotScore",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child:  Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      "YOUR PICK",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Image(height:100,width:100,image: AssetImage('images/$myPic.png'))

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      "ROBOT PICK",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Image(height:100,width:100,image: AssetImage('images/$cpuPic.png'))
                                  ],
                                ),

                              ),
                            ],
                          ),
                          Text(pointShower.toString().toUpperCase(),style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child:  Column(
                        children: [
                          const Text(
                            "PICK ONE OF FOLLOWING",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: ()
                                    {


                                      myPIC1='1';
                                      winner();

                                    },
                                    child: const Image(height: 100, image: AssetImage('images/1.png',))),
                                InkWell(
                                    onTap: ()
                                    {
                                      myPIC1='2';
                                      winner();
                                    },
                                    child: const Image(height :100,image: AssetImage('images/2.png'))),
                                InkWell(
                                    onTap: ()
                                    {

                                      myPIC1='3';
                                      winner();

                                    },
                                    child: const Image(height:100,image: AssetImage('images/3.png'))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void winner()
  {

    int k=random.nextInt(3)+1;
    cpuPic=k.toString();
    myPic=myPIC1;
    if(myPic==cpuPic)
    {
      pointShower="No Point For Both";
    }
    else if(myPic=='1'&&cpuPic=='2')
    {
      pointShower="Point For Robot \n Bcz Paper Beats Rock";
      ++robotScore;
    }
    else if(myPic=='1' && cpuPic=='3')
    {
      pointShower="Point for You \n Bcz Rock Beats Scissor";
      ++myScr;
    }
    else if(myPic=='2' && cpuPic=='1')
    {
      pointShower="Point For You \n Bcz Paper Beats Rock";
      ++myScr;
    }
    else if(myPic=='2' && cpuPic=='3')
    {
      pointShower="Point For Robot \n Bcz Scissor Beats Paper";
      ++robotScore;
    }
    else if(myPic=='3' && cpuPic=='1')
    {
      pointShower="Point For  Robot  \n Bcz Rock Beats Scissor";
      ++robotScore;
    }
    else if(myPic=='3' && cpuPic=='2')
    {
      pointShower="Point For YOU \n Bcz Scissor Beats Paper";
      ++myScr;
    }
    else
    {
      pointShower="";
    }
    setState(() {

    });
    winnerScreen();
  }

  void winnerScreen()
  {
    if(myScr>5 || robotScore>5)
    {

Navigator.pushNamed(context, WinnerScreen.id, arguments: {
'mine':myScr,
  'robot':robotScore
});

    }
  }
}