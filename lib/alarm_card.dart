import 'package:flutter/material.dart';
import 'constants/enums.dart';
import 'constants/themes.dart';

class BuildCard extends StatefulWidget {
  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  @override
  Widget build(BuildContext context) {
    List<Day> days = [
      Day('M'),
      Day('T'),
      Day('W'),
      Day('T'),
      Day('F'),
      Day('S'),
      Day('S'),
    ];

    bool isSwitched = false;
    var textValue = "Switch is OFF";

    void toggleSwitch(bool value) {
      if (isSwitched == false) {
        setState(() {
          isSwitched = true;
          textValue = 'Switch Button is ON';
        });
        print('Switch Button is ON');
      } else {
        setState(() {
          isSwitched = false;
          textValue = 'Switch Button is OFF';
        });
        print('Switch Button is OFF');
      }
    }

    return Material(
      elevation: 8,
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 60,
        decoration: CustomTheme.cardGrad,
        child: ElevatedButton(
          onPressed: null,
          // Opens a new overlay container that displays a row of
          //textbuttons instead - with mainAxisSize.min
          //
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Row(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: days.map((day) => buildDay(day)).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    print(isSwitched);
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                  // inactiveTrackColor: Colors.white30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDay(Day day) {
    return Flexible(
      flex: 1,
      child: Text(
        '${day.title}  ',
        style: TextStyle(
            color: day.isActive
                ? Colors.blue
                : Theme.of(context).textTheme.headline1!.color,
            fontSize: 13,
            fontWeight: FontWeight.w800,
            fontFamily: 'SF Pro Display'),
      ),
    );
  }
}
