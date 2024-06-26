import 'package:daily_execises/bottomnavbar.dart';
import 'package:daily_execises/category_card.dart';
import 'package:daily_execises/constant.dart';
import 'package:daily_execises/screens/details_screen.dart';
import 'package:daily_execises/screens/exercise.dart';
import 'package:daily_execises/screens/menu.dart';
import 'package:daily_execises/screens/setting_page.dart';
import 'package:daily_execises/screens/yoga.dart';
import 'package:daily_execises/search_bar.dart';
import 'package:daily_execises/to_do_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

void main() async {

  //init the hive 
  await Hive.initFlutter();

  //open a box 
 var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      drawer: new Drawer(
        child: MenuOption(),
      ),
      bottomNavigationBar: DefaultNav(),
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: Color(0xFFF5CEBB),
              image: DecorationImage(
                  image: AssetImage("assets/images/ndraw_pilates_gpdb.png")),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        scaffoldKey.currentState!.openDrawer();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2BEA1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset("assets/icons/menu.svg"),
                      ),
                    ),
                  ),
                  Text(
                    "Good Morning \nSaurabh",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  Search_bar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        CategoryCard(
                          svgSrc: "assets/icons/Hamburger.svg",
                          title: "Diet Recommendation",
                          press: () {},
                        ),
                        CategoryCard(
                          svgSrc: "assets/icons/Excrecises.svg",
                          title: "Kegel Exercises",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Exercise(),
                              ),
                            );
                          },
                        ),
                        CategoryCard(
                          svgSrc: "assets/icons/Meditation.svg",
                          title: "Meditation",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(),
                              ),
                            );
                          },
                        ),
                        CategoryCard(
                          svgSrc: "assets/icons/yoga.svg",
                          title: "Yoga",
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => YogaPage()));
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DefaultNav extends StatelessWidget {
  const DefaultNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavBar(
            svgSrc: "assets/icons/calendar.svg",
            title: "Today",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TodoList()),
              );
            },
          ),
          BottomNavBar(
            svgSrc: "assets/icons/gym.svg",
            title: "All Exercises",
            press: () {},
            isActive: true,
          ),
          BottomNavBar(
            svgSrc: "assets/icons/Settings.svg",
            title: "Settings",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
