import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'themes.dart';
import 'package:animated_background/animated_background.dart';
import 'rain.dart';
// import 'alarm_card.dart';
import 'enums.dart';

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
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bgDark.png'),
                        fit: BoxFit.cover),
                  ),
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
              child: Column(
                children: [
                  // Top part ========================================
                  Wrap(
                    // flex: 1,
                    // fit: FlexFit.loose,
                    children: [
                      Row(
                        // color: Colors.red,
                        // padding: const EdgeInsets.only(left: 5),
                        // direction: Axis.horizontal,
                        // crossAxisAlignment:
                        //     CrossAxisAlignment.baseline,
                        // textBaseline: TextBaseline.alphabetic,
                        children: [
                          Flexible(
                            flex: 24,
                            child: Text(
                              '12:00',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            flex: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Monday',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                Text(
                                  'AM',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .color,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'SF Pro Display'),
                                ),
                              ],
                            ),
                          ),
                          // const SizedBox(
                          //   width: 20,
                          // ),
                          Expanded(
                            flex: 15,
                            child: SizedBox(
                              // color: Colors.green,
                              child: Stack(
                                children: const [
                                  Opacity(
                                    opacity: 0.6,
                                    child: Image(
                                      // alignment: Alignment.centerRight,
                                      image: AssetImage(
                                        'assets/images/Cloud.png',
                                      ),
                                      colorBlendMode: BlendMode.darken,
                                      // fit: BoxFit.cover,
                                      width: 200,
                                    ),
                                  ),
                                  // Image(
                                  //   image: AssetImage(
                                  //     'assets/images/Moon.png',
                                  //   ),
                                  //   width: 200,
                                  //   // fit: BoxFit.cover,
                                  //   color: Colors.white,
                                  // ),
                                  Image(
                                    image: AssetImage(
                                      'assets/images/Sun.png',
                                    ),
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // End of top part =================================
                  // Bottom part ========================================
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: [
                      buildCard(),
                      buildCard(),
                      buildCard(),
                      buildCard(),
                      buildCard(),
                    ],
                  ),
                  // End of bottom part =================================
                  Container(
                      alignment: Alignment.center,
                      width: 50,
                      color: Colors.green,
                      child: const IconButton(
                          onPressed: null, icon: Icon(Icons.add))),
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

  Container buildCard() {
    // (List<int> activeDays)
    // activeDays.forEach((activeDay) {days.get(activeDay).isActive = true });
    // HashMap<int, Days> days = HashMap();
    // days.addAll({
    //   1 : Days('M'),
    //   2 : Days('T', isActive: true),
    //   3 : Days('W'),
    //   4 : Days('T'),
    //   5 : Days('F'),
    //   6 : Days('S'),
    //   7: Days('S'),
    // });

    List<Days> days = [
      Days('M'),
      Days('T'),
      Days('W'),
      Days('T'),
      Days('F'),
      Days('S'),
      Days('S'),
    ];

    bool isSwitched = false;

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
      width: double.infinity,
      height: 60,
      decoration: CustomTheme.cardGrad,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '12:00',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'AM',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:
                      days.map((e) => buildDay(e.title, e.isActive)).toList(),
                ),
              ),
            ],
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                print(isSwitched);
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Text buildDay(String title, bool isActive) {
    return Text(
      title,
      style: TextStyle(
          color: isActive
              ? Colors.blue
              : Theme.of(context).textTheme.headline1!.color,
          fontSize: 13,
          fontWeight: FontWeight.w800,
          fontFamily: 'SF Pro Display'),
    );
  }
}
