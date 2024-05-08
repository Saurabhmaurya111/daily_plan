import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Search_bar extends StatelessWidget {
  const Search_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29.5),
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          hintText: "Search",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
