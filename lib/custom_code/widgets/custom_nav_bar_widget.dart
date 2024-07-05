// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CustomNavBarWidget extends StatefulWidget {
  const CustomNavBarWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CustomNavBarWidgetState createState() => _CustomNavBarWidgetState();
}

class _CustomNavBarWidgetState extends State<CustomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CurvedNavigationBar(
        height: 100,
        backgroundColor: Color(0xFF000000),
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.chat_bubble_outline),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.search),
            label: 'Search',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.newspaper),
            label: 'Feed',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity),
            label: 'Personal',
          ),
        ],
        onTap: (index) {
          // Handle button tap
        },
      ),
    );
  }
}

// CurvedNavigationBar(
//
//
//       items: <Widget>[
//
//         Icon(Icons.list, size: 30),
//         Icon(Icons.compare_arrows, size: 30),
//       ],
//       onTap: (index) {
//         //Handle button tap
//       },
//     ),
