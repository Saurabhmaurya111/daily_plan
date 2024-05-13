import 'package:daily_execises/bottomnavbar.dart';
import 'package:daily_execises/constant.dart';
import 'package:daily_execises/main.dart';
import 'package:daily_execises/screens/details_screen.dart';
import 'package:daily_execises/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class YogaPage extends StatelessWidget {
  const YogaPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: DefaultNav(),
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              image: DecorationImage(
                image: AssetImage("assets/images/yog_back_orgi.jpg"),
                fit: BoxFit.fitHeight,
                
              ),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Text(
                    "Yoga",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "3-10 MIN course",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: size.width * .6,
                    child: Text(
                        "Flexibility, strength, stress relief, improved posture, mental clarity, better breathing, balance, relaxation, mindfulness etc "),
                  ),
                  SizedBox(
                    width: size.width * .5,
                    child: Search_bar(),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      SessionCard(
                        sessionNum: 1,
                        iconcolor: Colors.green,
                        isDone: true,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 2,
                        iconcolor: Colors.green,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 3,
                        iconcolor: Colors.green,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 4,
                        iconcolor: Colors.green,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 5,
                        iconcolor: Colors.green,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 6,
                        iconcolor: Colors.green,
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Yoga",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.all(10),
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          )
                        ]),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            "assets/icons/yoga.svg"),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Basics 2",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text("Start your deepen practice"),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10),
                        child: SvgPicture.asset("assets/icons/Lock.svg"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

