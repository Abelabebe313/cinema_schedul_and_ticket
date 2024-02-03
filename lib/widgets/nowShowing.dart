import 'package:cinema_schedule_/screens/detail_page.dart';
import 'package:flutter/material.dart';

class NowShowing extends StatefulWidget {
  const NowShowing({super.key});

  @override
  State<NowShowing> createState() => _NowShowingState();
}

class _NowShowingState extends State<NowShowing> {
  List<Map<String, dynamic>> Todays_Movies = [
    {
      'title': 'Aquaman and the Lost Kingdom',
      'description':
          "After failing to defeat Aquaman the first time, Black Manta wields the power of the mythic Black Trident to unleash an ancient and malevolent force. Hoping to end his reign of terror, Aquaman forges an unlikely alliance with his brother, Orm, the former king of Atlantis. Setting aside their differences, they join forces to protect their kingdom and save the world from irreversible destruction.",
      'rating': 4.5,
      'date': DateTime(2023, 11, 30),
      'image': 'assets/images/movies/aquaman.jpg',
      'catagories': ['Action', 'Adventure', 'si-fi'],
      'director': 'Abel Abebe'
    },
    {
      'title': 'Expendables 4',
      'description':
          "Armed with every weapon they can get their hands on, the Expendables are the world's last line of defense and the team that gets called when all other options are off the table.",
      'rating': 3.8,
      'date': DateTime(2023, 12, 15),
      'image': 'assets/images/movies/expendables.jpg',
      'catagories': ['Action', 'Fantasy'],
      'director': 'Abel Abebe'
    },
    {
      'title': 'Mission Impossible 7',
      'description':
          "Ethan Hunt and the IMF team must track down a terrifying new weapon that threatens all of humanity if it falls into the wrong hands. With control of the future and the fate of the world at stake, a deadly race around the globe begins. Confronted by a mysterious, all-powerful enemy, Ethan is forced to consider that nothing can matter more than the mission -- not even the lives of those he cares about most.",
      'rating': 8.5,
      'date': DateTime(2023, 11, 30),
      'image': 'assets/images/movies/mission.jpg',
      'catagories': ['Action', 'Adventure', 'Fantasy'],
      'director': 'Abel Abebe'
    },
    {
      'title': 'Oppenheimer',
      'description':
          "During World War II, Lt. Gen. Leslie Groves Jr. appoints physicist J. Robert Oppenheimer to work on the top-secret Manhattan Project. Oppenheimer and a team of scientists spend years developing and designing the atomic bomb. Their work comes to fruition on July 16, 1945, as they witness the world's first nuclear explosion, forever changing the course of history.",
      'rating': 7.8,
      'date': DateTime(2023, 12, 15),
      'image': 'assets/images/movies/oppenheimer.jpg',
      'catagories': ['Si-fi', 'Documentary', 'Biography'],
      'director': 'Abel Abebe'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // === Coming Soon Movies Slider ====
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 20, 0, 10),
          child: Text(
            'Todays Movies',
            style: TextStyle(
                // color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins-SemiBold'),
          ),
        ),
        // === slider ===
        Container(
          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
          height: MediaQuery.of(context).size.height * 0.68,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Todays_Movies.length,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.68,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  image: Todays_Movies[index]['image'],
                                  title: Todays_Movies[index]['title'],
                                  description: Todays_Movies[index]
                                      ['description'],
                                  catagories: Todays_Movies[index]
                                      ['catagories'],
                                  rating: Todays_Movies[index]['rating'],
                                  director: Todays_Movies[index]['director'],
                                )));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            '${Todays_Movies[index]['image']}', // << image goes here
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
                            '${Todays_Movies[index]['title']}',
                            style: const TextStyle(
                              fontFamily: 'Poppins-SemiBold',
                              fontSize: 20,
                              // color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xff54A8E5)),
                                child: const Center(
                                  child: Text(
                                    '12:30 pm',
                                    style: TextStyle(
                                        fontFamily: 'Poppins-Medium',
                                        fontSize: 14,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xff54A8E5)),
                                child: const Center(
                                  child: Text(
                                    '12:30 pm',
                                    style: TextStyle(
                                        fontFamily: 'Poppins-Medium',
                                        fontSize: 14,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}
