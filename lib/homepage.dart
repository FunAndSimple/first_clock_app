import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'themes.dart';
import 'package:animated_background/animated_background.dart';
import 'rain.dart';
import 'enums.dart';
import 'alarm_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double oldHeight = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double height = oldHeight - padding.top - padding.bottom;
    // Color bgColor = const Color(0xFF0E0B13);
    // Color bgColor = const Color(0xFFC29675);
    bool isSwitched = false;

    return Scaffold(
      // body: SafeArea(
      //   top: true,
      //   bottom: false,
      //   child: Stack(
      body: Stack(
        children: [
          // Background ======================================

          AnimatedBackground(
            behaviour: shootingStarBehaviour,
            vsync: this,
            child: Stack(
              children: [
                Container(decoration: CustomTheme.bgDark),
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
              child: Column(
                children: [
                  // Top part ========================================
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                            // flex: 3,
                            // fit: FlexFit.loose,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 30, 0),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          '12:00',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                        ),
                                        Text(
                                          'AM',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ]),
                        Expanded(
                          // flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            child: Stack(
                              children: const [
                                Opacity(
                                  opacity: 0.6,
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage(
                                      'assets/images/Cloud.png',
                                    ),
                                    colorBlendMode: BlendMode.darken,
                                    fit: BoxFit.cover,
                                    // width: 100,
                                  ),
                                ),
                                Image(
                                  image: AssetImage(
                                    'assets/images/Moon.png',
                                  ),
                                  width: 100,
                                  fit: BoxFit.cover,
                                  color: Colors.white,
                                ),
                                // Image(
                                //   image: AssetImage(
                                //     'assets/images/Sun.png',
                                //   ),
                                //   width: 100,
                                //   fit: BoxFit.cover,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // End of top part =================================
                  // Bottom part ========================================
                  Flexible(
                    flex: 9,
                    fit: FlexFit.tight,
                    child: Container(
                      width: width,
                      color: Colors.redAccent.withOpacity(0.3),
                      // color: Colors.transparent,
                      child: ListView(
                        children: [
                          alarm_card.buildCard(),
                          buildCard(),
                          buildCard(),
                          buildCard(),
                          buildCard(),
                          buildCard(),
                          buildCard(),
                          buildCard(),
                        ],
                      ),
                    ),
                  ),
                  // End of bottom part =================================
                ],
              ),
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
        onTap: (index) {},
      ),
    );
  }

  
}
