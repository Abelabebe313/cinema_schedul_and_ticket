// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cinema_schedule_/screens/seat_selection.dart';
import 'package:flutter/material.dart';

import 'package:cinema_schedule_/widgets/nowShowing.dart';
import 'package:cinema_schedule_/widgets/upcoming.dart';

class Detail extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final List<String> catagories;
  final double rating;
  final String director;
  const Detail({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.catagories,
    required this.rating,
    required this.director,
  }) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int activeIndex = 0;
  final List<Widget> MovieEventsWidgets = [
    const NowShowing(),
    const UpComing()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1E25),
      appBar: AppBar(
        backgroundColor: const Color(0xff1B1E25),
        foregroundColor: Colors.white,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
              'Movie Detail',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Poppins-SemiBold'),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.48,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      '${widget.image}', // << image goes here
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff54A8E5)),
                    child: const Center(
                      child: Text(
                        '2h 43m',
                        style: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
            child: Text(
              widget.title, // << Title goes here
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Medium',
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
            child: Row(
              children: [
                Text(
                  'Director: ${widget.director}', // << director goes here
                  style: const TextStyle(
                    color: Color(0xffBABFC9),
                    fontSize: 14,
                    fontFamily: 'Poppins-Light',
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  '${widget.rating}',
                  style: const TextStyle(
                    color: Color(0xffBABFC9),
                    fontSize: 14,
                    fontFamily: 'Poppins-Light',
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
            child: Wrap(
              spacing: 8.0, // Adjust the spacing between categories
              runSpacing: 8.0, // Adjust the spacing between rows of categories
              children: widget.catagories.map((category) {
                return Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff252932)),
                  child: Center(
                    child: Text(
                      category,
                      style: const TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize: 12,
                          color: Color(0xffB2B5BB)),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 0, 5),
            child: Text(
              'Synopsis', // << Title goes here
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Medium',
                fontSize: 18,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 120,
              width: 350,
              child: SingleChildScrollView(
                child: Text(
                  widget.description, // << description goes here
                  style: const TextStyle(
                    fontFamily: 'Poppins-Light',
                    fontSize: 12,
                    color: Color(0xffBABFC9),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeatSelection(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(315, 57), // Set the width and height
                primary: Color(0xff54A8E5), // Background color
                onPrimary: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Border radius
                ),
              ),
              child: const Text(
                'Book Ticket',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins-Medium',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
