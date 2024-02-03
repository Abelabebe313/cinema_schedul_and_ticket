import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cinema_schedule_/screens/seat_selection.dart';
import 'package:cinema_schedule_/widgets/casts_expansion.dart';
import 'package:cinema_schedule_/widgets/production_expansion.dart';
import 'package:cinema_schedule_/widgets/synopsis_expansion.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final List<String> catagories;
  final double rating;
  final String director;
  const DetailPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.catagories,
    required this.rating,
    required this.director,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            expandedHeight: 300.0,
            actions: [
              Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff54A8E5),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FluentSystemIcons.ic_fluent_bookmark_regular,
                      color: Colors.white,
                    )),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                widget.image, // Replace with your movie poster URL
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  widget.title, // << Title goes here
                  style: const TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 40.0,
            // backgroundColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(15),
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                child: Row(
                  children: [
                    Text(
                      'Director: ${widget.director}', // << director goes here
                      style: TextStyle(
                        color: AdaptiveTheme.of(context).mode.isDark
                            ? Color(0xffBABFC9)
                            : Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins-Light',
                      ),
                    ),
                    const SizedBox(width: 20),
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
                    const SizedBox(width: 20),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SeatSelection(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(125, 30),
                              backgroundColor: Color(0xff54A8E5),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Book Ticket',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins-Medium',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 0, 5),
                  child: Text(
                    'Genre', // << Title goes here
                    style: TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Poppins-Medium',
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                  child: Wrap(
                    spacing: 8.0, // Adjust the spacing between categories
                    runSpacing:
                        8.0, // Adjust the spacing between rows of categories
                    children: widget.catagories.map((category) {
                      return Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AdaptiveTheme.of(context).mode.isDark
                                ? const Color(0xff252932)
                                : Color(0xff54A8E5)),
                        child: Center(
                          child: Text(
                            category,
                            style: TextStyle(
                                fontFamily: 'Poppins-Medium',
                                fontSize: 12,
                                color: AdaptiveTheme.of(context).mode.isDark
                                    ? Color(0xffB2B5BB)
                                    : Colors.white),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SynopsisExpansionWidget(
                  context: context,
                  description: widget.description,
                ),
                CastsExpansionWidget(
                  context: context,
                  description: widget.description,
                ),
                ProductionExpansionWidget(
                  context: context,
                  description: widget.description,
                ),

                SizedBox(height: 10),
                // Center(
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const SeatSelection(),
                //         ),
                //       );
                //     },
                //     style: ElevatedButton.styleFrom(
                //       fixedSize: Size(315, 57), // Set the width and height
                //       primary: Color(0xff54A8E5), // Background color
                //       onPrimary: Colors.white, // Text color
                //       shape: RoundedRectangleBorder(
                //         borderRadius:
                //             BorderRadius.circular(12), // Border radius
                //       ),
                //     ),
                //     child: const Text(
                //       'Book Ticket',
                //       style: TextStyle(
                //         fontSize: 18,
                //         fontFamily: 'Poppins-Medium',
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
