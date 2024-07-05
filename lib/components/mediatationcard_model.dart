import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'mediatationcard_widget.dart' show MediatationcardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MediatationcardModel extends FlutterFlowModel<MediatationcardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [AdMob - Show Interstitial Ad] action in Container widget.
  bool? interstitialAdSuccess;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
