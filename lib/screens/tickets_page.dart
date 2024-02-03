import 'package:cinema_schedule_/screens/seat_selection.dart';
import 'package:cinema_schedule_/widgets/saved_ticket.dart';
import 'package:flutter/material.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Saved Tickets',
            style: TextStyle(
                // color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins-SemiBold'),
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,

        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return const SavedTicket();
          },
        ),
      ),
    );
  }
}
