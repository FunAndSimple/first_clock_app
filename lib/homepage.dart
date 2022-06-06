import 'package:animated_background/animated_background.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:first_clock_app/alarm_page.dart';
import 'package:first_clock_app/constants/rain.dart';
import 'package:first_clock_app/routine_page.dart';
import 'package:first_clock_app/stopwatch_page.dart';
import 'package:first_clock_app/timer_page.dart';
import 'package:flutter/material.dart';
// import 'alarm_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int selectedIndex = 0;

  List<Widget> widgetOptions = <Widget>[
    MyAlarm(),
    MyStopWatch(),
    MyTimer(),
    MyRoutine(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double oldHeight = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double height = oldHeight - padding.top - padding.bottom;

    return Scaffold(
      body: Stack(
        children: [
          // Background ======================================
          AnimatedBackground(
            behaviour: shootingStarBehaviour,
            vsync: this,
            child: Stack(
              children: [
                Container(
                  color: Colors.grey.shade900,
                  // decoration: const BoxDecoration(
                  //   image: DecorationImage(
                  //       image: AssetImage('assets/images/bgDark.png'),
                  //       fit: BoxFit.cover),
                  // ),
                ),
                // Container(decoration: CustomTheme.bgLight),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/random_stars.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: const Image(
                    image: AssetImage('assets/images/gemini_outline.png'),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: const Image(
                    image: AssetImage('assets/images/gemini.png'),
                  ),
                ),
              ],
            ),
          ),
          // Background ======================================
          SizedBox(
            width: width,
            height: height,
            child: Padding(
              padding: EdgeInsets.only(top: padding.top),
              child: widgetOptions[selectedIndex],
            ),
          ),
        ],
      ),

      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        animationDuration: const Duration(milliseconds: 200),
        backgroundColor: Colors.grey,
        items: const [
          Icon(Icons.alarm, size: 30),
          Icon(Icons.watch_later_outlined, size: 30),
          Icon(Icons.timer, size: 30),
          Icon(Icons.bed, size: 30),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
