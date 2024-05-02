import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tripx_admin_application/utils/colors.dart';

final images = [
  'assets/image/spalsh.jpeg',
  'assets/image/spalsh.jpeg',
  'assets/image/spalsh.jpeg',
  'assets/image/spalsh3.jpeg'
];
int activeindex = 0;
List<String> locations = ['Kashmir', 'Singapore', 'Delhi', 'Goa'];

Widget buildindicator() => AnimatedSmoothIndicator(
    effect: const ExpandingDotsEffect(
        activeDotColor: colorteal, dotWidth: 15, dotHeight: 5),
    activeIndex: activeindex,
    count: images.length);

Widget buildimage(String imagess, int index) => SizedBox(
      height: 300,
      width: 300,
      child: Image.asset(
        imagess,
        fit: BoxFit.cover,
      ),
    );

class Carosel extends StatefulWidget {
  const Carosel({super.key});

  @override
  State<Carosel> createState() => _CaroselState();
}

class _CaroselState extends State<Carosel> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}