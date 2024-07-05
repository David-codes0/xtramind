// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

Future randomMeditationGen() async {
  // Add your function code here!

// In this example, you can use any method to store the last generated date.
// For simplicity, I'm using a global variable here.
  DateTime? _lastGeneratedDate;
  DateTime now = DateTime.now();

  DateTime _getLastGeneratedDate() {
    // You can implement your logic to retrieve the last generated date.
    // For this example, I'm just returning the global variable _lastGeneratedDate.
    return _lastGeneratedDate!;
  }

  bool _isNewDay(DateTime now) {
    // Check if the last generated date is null or not equal to the current date
    DateTime lastGeneratedDate = _getLastGeneratedDate();
    return lastGeneratedDate == null || lastGeneratedDate.day != now.day;
  }

  void _saveLastGeneratedDate(DateTime now) {
    // You can implement your logic to save the last generated date.
    // For this example, I'm just assigning the current date to the global variable _lastGeneratedDate.
    _lastGeneratedDate = now;
  }

  // Check if it's a new day
  if (_isNewDay(now)) {
    // Generate a random number between 1 and 100 (inclusive)
    int randomNumber = Random().nextInt(100) + 1;

    // Save the current date to use as a reference for future calls
    _saveLastGeneratedDate(now);

    print(randomNumber.toString());
  } else {
    // It's not a new day, so return 0 or any other value to indicate no new random number generated
    print('0');
  }
}
