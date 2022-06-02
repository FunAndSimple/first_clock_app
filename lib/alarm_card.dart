import 'package:flutter/material.dart';
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children:
                    days.map((e) => buildDay(e.title, e.isActive)).toList(),
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
          fontSize: 16,
          fontWeight: FontWeight.w800,
          fontFamily: 'SF Pro Display'),
    );
  }