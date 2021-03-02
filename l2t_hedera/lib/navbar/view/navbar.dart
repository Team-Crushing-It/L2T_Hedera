import 'package:flutter/material.dart';

class Navbar extends AppBar {
  Widget build(BuildContext context) {
    return _buildHomeAppBarWeb();
  }

  AppBar _buildHomeAppBarWeb() {
    return AppBar(
      backgroundColor: Color(0xffFFD700),
      title: Row(
        children: [
          const Text(
            'L2T',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
          SizedBox(width: 10),
          CircleAvatar(child: Icon(Icons.person), radius: 15),
          SizedBox(width: 10),
          Icon(Icons.inbox, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.emoji_events, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.live_help, color: Colors.black),
        ],
      ),
    );
  }
}
