import 'package:daily_execises/constant.dart';
import 'package:daily_execises/main.dart';
import 'package:daily_execises/screens/details_screen.dart';
import 'package:daily_execises/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Exercise extends StatelessWidget {
  const Exercise({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: DefaultNav(),
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Colors.black12,
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/exer.jpg",
                ),
                fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.4),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Text(
                    "Exersice",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 236, 194, 131),
                        fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "3-10 MIN course",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.white54,
                      color: Color.fromARGB(255, 228, 173, 90),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: size.width * .5,
                    child: Text(
                      "Exercise boosts physical health, mental well-being, and longevity. It enhances mood..",
                      style: TextStyle(
                        backgroundColor: Colors.white60,
                         color: Color.fromARGB(255, 228, 173, 90),
                      ),
                    ),
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
                          isDone: true,
                          iconcolor: kActiveIconColor,
                          press: () {},
                        ),
                        SessionCard(
                          sessionNum: 2,
                          iconcolor: kActiveIconColor,
                          press: () {},
                        ),
                        SessionCard(
                          sessionNum: 3,
                          iconcolor: kActiveIconColor,
                          press: () {},
                        ),
                        SessionCard(
                          sessionNum: 4,
                          iconcolor: kActiveIconColor,
                          press: () {},
                        ),
                        SessionCard(
                          sessionNum: 5,
                          iconcolor: kActiveIconColor,
                          press: () {},
                        ),
                        SessionCard(
                          sessionNum: 6,
                          iconcolor: kActiveIconColor,
                          press: () {},
                        ),
                         SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Prime Content",
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
                              "assets/icons/Excrecises.svg"),
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
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
