import 'package:cinema_schedule_/widgets/ticketData.dart';
import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1E25),
      appBar: AppBar(
        backgroundColor: const Color(0xff1B1E25),
        foregroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 80),
          child: Text(
            'E-Ticket',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins-SemiBold'),
          ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 0, 5),
            child: Text(
              'Instruction', // << Title goes here
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
                  'Come to the cinema, show and scan the barcode to the space provided. Continue to comply with health protocols.', // << description goes here
                  style: TextStyle(
                    fontFamily: 'Poppins-Light',
                    fontSize: 12,
                    color: Color(0xffBABFC9),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: TicketWidget(
              width: 350,
              height: 500,
              isCornerRounded: true,
              padding: EdgeInsets.all(20),
              child: TicketData(),
            ),
          ),
        ],
      ),
    );
  }
}
