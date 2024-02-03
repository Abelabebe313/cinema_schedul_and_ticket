import 'package:flutter/material.dart';

class BoxOfficeLists extends StatefulWidget {
  const BoxOfficeLists({
    super.key,
  });

  @override
  State<BoxOfficeLists> createState() => _BoxOfficeListsState();
}

class _BoxOfficeListsState extends State<BoxOfficeLists> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 0),
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: 120,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Card(
              // color: Colors.white,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Container(
                    height: 75,
                    width: 93,
                    decoration: BoxDecoration(
                      // color: Color(0XFFF0F0FB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/movies/aquaman.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Aquaman",
                              style: TextStyle(
                                fontFamily: "Poppins-Light",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                // color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            '6.4',
                            style: const TextStyle(
                              color: Color(0xffBABFC9),
                              fontSize: 14,
                              fontFamily: 'Poppins-Light',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 20,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xff54A8E5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Action',
                            style: TextStyle(
                              fontFamily: "Poppins-ExtraLight",
                              fontSize: 12,
                              color: Colors.white
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
