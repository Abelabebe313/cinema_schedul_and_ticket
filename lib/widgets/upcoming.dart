import 'package:flutter/material.dart';

class UpComing extends StatefulWidget {
  const UpComing({super.key});

  @override
  State<UpComing> createState() => _UpComingState();
}

class _UpComingState extends State<UpComing> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Upcoming Movies',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
