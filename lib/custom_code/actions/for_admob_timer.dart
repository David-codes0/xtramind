// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

Future forAdmobTimer() async {
  // Add your function code here!
  Timer(Duration(seconds: 15), () {
    // myBoolean = true;
    FFAppState().update(() {
      FFAppState().timerSwitch = true;
    });
    print('Boolean value changed to true!');
  });
}
