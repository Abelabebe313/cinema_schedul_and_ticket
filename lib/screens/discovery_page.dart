import 'package:flutter/material.dart';

class Discovery extends StatefulWidget {
  const Discovery({super.key});

  @override
  State<Discovery> createState() => _DiscoveryState();
}

class _DiscoveryState extends State<Discovery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1E25),
      appBar: AppBar(
        backgroundColor: const Color(0xff1B1E25),
        title: const Center(
          child: Text(
            'Explore Movie',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins-SemiBold'),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
