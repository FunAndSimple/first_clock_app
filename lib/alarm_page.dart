import 'package:flutter/material.dart';
import 'alarm_card.dart';

// import 'package:flutter/src/widgets/framework.dart';
class MyAlarm extends StatefulWidget {
  @override
  State<MyAlarm> createState() => _MyAlarm();
}

class _MyAlarm extends State<MyAlarm> {
  // const myAlarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;

    return Expanded(
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
                              color:
                                  Theme.of(context).textTheme.headline1!.color,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'SF Pro Display'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: SizedBox(
                      // color: Colors.green,
                      child: Stack(
                        children: const [
                          Opacity(
                            opacity: 0.6,
                            child: Image(
                              image: AssetImage(
                                'assets/images/Cloud.png',
                              ),
                              colorBlendMode: BlendMode.darken,
                              width: 200,
                            ),
                          ),
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
          SizedBox(
            width: double.infinity,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                BuildCard(),
                BuildCard(),
                BuildCard(),
                BuildCard(),
                BuildCard(),
              ],
            ),
          ),
          // End of bottom part =================================
          Container(
              alignment: Alignment.center,
              width: 50,
              color: Colors.green,
              child: const IconButton(onPressed: null, icon: Icon(Icons.add))),
        ],
      ),
    );
  }
}
