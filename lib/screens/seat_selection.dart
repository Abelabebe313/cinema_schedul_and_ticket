import 'package:cinema_schedule_/screens/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:book_my_seat/book_my_seat.dart';

class SeatSelection extends StatefulWidget {
  const SeatSelection({super.key});

  @override
  State<SeatSelection> createState() => _SeatSelectionState();
}

class _SeatSelectionState extends State<SeatSelection> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
    );

    if (picked != null && picked != DateTime.now()) {
      // Save only month and year to the text field
      final String formattedDate =
          "${picked.day}/${picked.month}/${picked.year}";
      _dateController.text = formattedDate;
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        _timeController.text = pickedTime.format(context);
      });
    }
  }

  Set<SeatNumber> selectedSeats = Set();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1E25),
      appBar: AppBar(
        backgroundColor: const Color(0xff1B1E25),
        foregroundColor: Colors.white,
        title: Text(
          'Select Seats',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Poppins-SemiBold'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                SizedBox(
                  width: 160,
                  height: 45,
                  child: TextField(
                    style: TextStyle(color: Color(0xffB2B5BB)),
                    controller: _dateController,
                    decoration: InputDecoration(
                      focusColor: Color(0xff54A8E5),
                      fillColor: Color(0xff54A8E5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      labelText: 'Date',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.date_range),
                        onPressed: () => _selectDate(context),
                        color: Color(0xffB2B5BB),
                      ),
                    ),
                    readOnly: true,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 160,
                  height: 45,
                  child: TextField(
                    style: TextStyle(color: Color(0xffB2B5BB)),
                    controller: _timeController,
                    decoration: InputDecoration(
                      focusColor: Color(0xff54A8E5),
                      fillColor: Color(0xff54A8E5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      labelText: 'Time',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.access_time),
                        onPressed: () => _selectTime(context),
                        color: Color(0xffB2B5BB),
                      ),
                    ),
                    readOnly: true,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
          //Screen representation
          SizedBox(
            width: 315,
            height: 88,
            child: Image.asset('assets/images/screen.png'),
          ),
          //Seat Map Section
          Container(
            height: 387,
            width: 315,
            child: Center(
              // width: double.maxFinite,
              // height: 500,
              child: SeatLayoutWidget(
                onSeatStateChanged: (rowI, colI, seatState) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: seatState == SeatState.selected
                          ? Text("Selected Seat[$rowI][$colI]",style: const TextStyle(fontFamily: 'Poppins-Light'))
                          : Text("De-selected Seat[$rowI][$colI]",style:const TextStyle(fontFamily: 'Poppins-Light')),
                    ),
                  );
                  if (seatState == SeatState.selected) {
                    selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));
                  } else {
                    selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                  }
                },
                stateModel: const SeatLayoutStateModel(
                  pathDisabledSeat: 'assets/images/',
                  pathSelectedSeat: 'assets/images/selected_seat.svg',
                  pathSoldSeat: 'assets/images/reserved_seat.svg',
                  pathUnSelectedSeat: 'assets/images/available_seat.svg',
                  rows: 8,
                  cols: 7,
                  seatSvgSize: 45,
                  currentSeatsState: [
                    [
                      SeatState.disabled,
                      SeatState.unselected,
                      SeatState.unselected,
                      SeatState.unselected,  // gap
                      SeatState.unselected,
                      SeatState.unselected,
                      SeatState.disabled,
                    ],
                    [
                      SeatState.unselected,
                      SeatState.unselected,
                      SeatState.unselected,
                      SeatState.unselected,  // gap
                      SeatState.unselected,
                      SeatState.unselected,
                      SeatState.unselected,
                    ],
                    [
                      SeatState.unselected,
                      SeatState.unselected,
                      SeatState.unselected,
                      SeatState.unselected,  // gap
                      SeatState.unselected,
                      SeatState.unselected,
                      SeatState.unselected,
                    ],
                    [
                      SeatState.disabled,
                      SeatState.disabled,
                      SeatState.disabled,
                      SeatState.disabled,  // gap
                      SeatState.disabled,
                      SeatState.disabled,
                      SeatState.disabled,
                    ],
                    [
                      SeatState.sold,
                      SeatState.sold,
                      SeatState.unselected,
                      SeatState.unselected,  // gap
                      SeatState.sold,
                      SeatState.sold,
                      SeatState.unselected,
                    ],
                    [
                      SeatState.sold,
                      SeatState.sold,
                      SeatState.unselected,
                      SeatState.unselected,  // gap
                      SeatState.sold,
                      SeatState.sold,
                      SeatState.unselected,
                    ],
                    [
                      SeatState.sold,
                      SeatState.sold,
                      SeatState.unselected,
                      SeatState.unselected,  // gap
                      SeatState.sold,
                      SeatState.sold,
                      SeatState.unselected,
                    ],
                    [
                      SeatState.disabled,
                      SeatState.unselected,
                      SeatState.unselected,
                      SeatState.unselected,  // gap
                      SeatState.unselected,
                      SeatState.unselected,
                      SeatState.disabled,
                    ],
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/selected_seat.png',
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Selected',
                    style: TextStyle(color: Color(0xffB2B5BB)),
                  )
                ],
              ),
              const SizedBox(width: 15),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/reserved_seat.png',
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Reserved',
                    style: TextStyle(color: Color(0xffB2B5BB)),
                  )
                ],
              ),
              const SizedBox(width: 15),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/available_seat.png',
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Available',
                    style: TextStyle(color: Color(0xffB2B5BB)),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(),
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
                'Checkout',
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

class SeatNumber {
  final int rowI;
  final int colI;

  const SeatNumber({required this.rowI, required this.colI});

  @override
  bool operator ==(Object other) {
    return rowI == (other as SeatNumber).rowI &&
        colI == (other as SeatNumber).colI;
  }

  @override
  int get hashCode => rowI.hashCode;

  @override
  String toString() {
    return '[$rowI][$colI]';
  }
}
