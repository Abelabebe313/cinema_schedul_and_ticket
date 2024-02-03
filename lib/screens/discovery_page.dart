import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cinema_schedule_/widgets/nowShowing.dart';
import 'package:cinema_schedule_/widgets/upcoming.dart';
import 'package:flutter/material.dart';

class Discovery extends StatefulWidget {
  const Discovery({super.key});

  @override
  State<Discovery> createState() => _DiscoveryState();
}

class _DiscoveryState extends State<Discovery> {
  int activeIndex = 0;
  final List<Widget> MovieEventsWidgets = [
    const NowShowing(),
    const UpComing()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff1B1E25),
      appBar: AppBar(
        // backgroundColor: const Color(0xff1B1E25),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text(
              'Explore Movie',
              style: TextStyle(
                  // color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Poppins-SemiBold'),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
              // color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 315,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AdaptiveTheme.of(context).mode.isDark ? const Color(0xff32363D) : Color.fromARGB(255, 241, 237, 237),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: activeIndex == 0 ? 145 : 132,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: activeIndex == 0 ? const Color(0xff54A8E5) : null,
                    ),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            activeIndex = 0;
                          });
                        },
                        child: Text(
                          'Now Showing',
                          style: TextStyle(
                            color: activeIndex == 0 ? Colors.white : Colors.grey,
                            fontFamily: 'Poppins-Medium',
                            fontSize: 14,
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: activeIndex == 1 ? 145 : 132,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: activeIndex == 1 ? const Color(0xff54A8E5) : null,
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          activeIndex = 1;
                        });
                      },
                      child: Text(
                        'Upcoming',
                        style: TextStyle(
                          color: activeIndex == 1 ? Colors.white : Colors.grey,
                          fontFamily: 'Poppins-Medium',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: MovieEventsWidgets[activeIndex],
          ),
        ],
      ),
    );
  }
}
