import 'package:daily_execises/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final void Function()? press;
  const CategoryCard({
    super.key,
    required this.svgSrc,
    required this.title, 
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                color: kShadowColor,
              )
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Spacer(),
                  SvgPicture.asset(svgSrc),
                  const Spacer(),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
