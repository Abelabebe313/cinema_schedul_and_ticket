import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cinema_schedule_/widgets/boxoffice_movies.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> upcomingMovies = [
    {
      'title': 'Aquaman 2',
      'description': 'Description for Movie 1',
      'rating': 4.5,
      'date': DateTime(2023, 11, 30),
      'image': 'assets/images/movies/aquaman.jpg',
    },
    {
      'title': 'Expendables 4',
      'description': 'Description for Movie 2',
      'rating': 3.8,
      'date': DateTime(2023, 12, 15),
      'image': 'assets/images/movies/expendables.jpg',
    },
    {
      'title': 'Mission Impossible ',
      'description': 'Description for Movie 1',
      'rating': 8.5,
      'date': DateTime(2023, 11, 30),
      'image': 'assets/images/movies/mission.jpg',
    },
    {
      'title': 'Oppenheimer',
      'description': 'Description for Movie 2',
      'rating': 7.8,
      'date': DateTime(2023, 12, 15),
      'image': 'assets/images/movies/oppenheimer.jpg',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff1B1E25),
      appBar: AppBar(
        // backgroundColor: const Color(0xff1B1E25),
        title: Container(
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(
                    color: Color(0xffAFAFAF),
                    fontSize: 14.0,
                    fontFamily: 'Poppins-Regular'),
              ),
              Text(
                'Abel',
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 18.0,
                  fontFamily: 'Poppins-Medium',
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Color(0XFFF0F0FB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/Rectangle 432.png', //---<< profile images goes here
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // ===== Search Bar ====
          SliverAppBar(
            pinned: false,
            floating: false,
            expandedHeight: 70,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: const EdgeInsets.only(
                    top: 20, right: 25, left: 25, bottom: 0),
                height: 50,
                decoration: BoxDecoration(
                  color: AdaptiveTheme.of(context).mode.isDark
                      ? Color.fromARGB(255, 38, 42, 50)
                      : const Color.fromARGB(255, 247, 242, 242),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Expanded(
                  child: TextField(
                    style: const TextStyle(
                      fontFamily: 'Poppins-Medium',
                      color: Color(0xff6F7277),
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search".tr(),
                      hintStyle: const TextStyle(
                        fontFamily: 'Poppins-Medium',
                        color: Color(0xff6F7277),
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(Icons.search, color: Color(0xff6F7277)),
                      contentPadding: EdgeInsets.only(
                          left: 10, top: 12, bottom: 15), // Add padding here
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverAppBar(
            pinned: false,
            floating: false,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // === Coming Soon Movies Slider ====
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 20, 0, 10),
                    child: Text(
                      'Coming Soon',
                      style: TextStyle(
                          // color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins-SemiBold'),
                    ),
                  ),

                  // === slider ===
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    height: MediaQuery.of(context).size.height * 0.38,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: upcomingMovies.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.38,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      '${upcomingMovies[index]['image']}', // << image goes here
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${upcomingMovies[index]['title']}',
                                      style: const TextStyle(
                                        fontFamily: 'Poppins-SemiBold',
                                        fontSize: 20,
                                        // color: Colors.white,
                                      ),
                                    ),
                                    const Text(
                                      'November 2023',
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Medium',
                                          fontSize: 14,
                                          color: Color(0xffAFAFAF)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // === scrobale Box office movies ===
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
                  child: Text(
                    'Box Office Movies',
                    style: TextStyle(
                        // color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Poppins-SemiBold'),
                  ),
                ),
                BoxOfficeLists(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
