import 'package:cinema_schedule_/screens/seat_selection.dart';
import 'package:flutter/material.dart';

class SavedTicket extends StatelessWidget {
  const SavedTicket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
          child: Text(
            '01 December 2023',
            style: TextStyle(
                // color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins-SemiBold'),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Container(
                width: 55,
                height: 70,
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
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Action',
                    style: TextStyle(
                        color: Color(0xff54A8E5),
                        fontSize: 12,
                        fontFamily: 'Poppins-Medium'),
                  ),
                  Row(
                    children: [
                      Text(
                        'Aquaman 2',
                        style: TextStyle(
                            // color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins-Medium'),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        '6.4',
                        style: TextStyle(
                          color: Color(0xffBABFC9),
                          fontSize: 14,
                          fontFamily: 'Poppins-Light',
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '2h 43m',
                    style: TextStyle(
                        color: Color(0xffAFAFAF),
                        fontSize: 12,
                        fontFamily: 'Poppins-Light'),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        // selected Time and Date
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Date',
                    style: TextStyle(
                        color: Color(0xffAFAFAF),
                        fontSize: 12,
                        fontFamily: 'Poppins-Light'),
                  ),
                  Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xffB2B5BB),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text('C4,C6'),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Time',
                    style: TextStyle(
                        color: Color(0xffAFAFAF),
                        fontSize: 12,
                        fontFamily: 'Poppins-Light'),
                  ),
                  Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xffB2B5BB),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text('C4,C6'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // selected seat and person
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'seat',
                    style: TextStyle(
                        color: Color(0xffAFAFAF),
                        fontSize: 12,
                        fontFamily: 'Poppins-Light'),
                  ),
                  Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xffB2B5BB),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text('C4,C6'),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'person',
                    style: TextStyle(
                        color: Color(0xffAFAFAF),
                        fontSize: 12,
                        fontFamily: 'Poppins-Light'),
                  ),
                  Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xffB2B5BB),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text('C4,C6'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // checkout and delete button
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 0, 10),
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
                  fixedSize: Size(160, 40),
                  backgroundColor: Color(0xff54A8E5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins-Medium',
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                width: 160,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffE55454),
                ),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
        //
        //
        const SizedBox(height: 20),
        Center(
          child: Container(
            width: 350,
            height: 1,
            color: const Color(0xffAFAFAF),
          ),
        ),
        const SizedBox(height: 20),
        //
        //
      ],
    );
  }
}