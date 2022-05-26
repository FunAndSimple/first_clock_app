import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double oldHeight = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double height = oldHeight - padding.top - padding.bottom;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: bgGrad,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                  width: 200,
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: const [
                      Text('12:00'),
                      Text('AM'),
                    ],
                  )),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 0),
                width: width * 0.9,
                height: height * 0.1,
                decoration: alarmGrad,
                // child: Row(
                //   children: [
                //     Column(
                //       children: const [
                //         Align(
                //           alignment: Alignment.centerLeft,
                //           child: Text('Hi'),
                //         ),
                //         Align(
                //           alignment: Alignment.centerLeft,
                //           child: Text('Bye'),
                //         ),
                //       ],
                //     ),
                //     const Align(
                //         alignment: Alignment.centerRight,
                //         child: Icon(
                //           Icons.label,
                //           size: 40,
                //         )),
                //   ],
                // ),
              ),
            ],
          ),
          Positioned(
              top: 300,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.add_box_rounded,
                    size: 100,
                  )))
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
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
