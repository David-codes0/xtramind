import '/components/image_circle_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for imageCircle component.
  late ImageCircleModel imageCircleModel;

  @override
  void initState(BuildContext context) {
    imageCircleModel = createModel(context, () => ImageCircleModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    imageCircleModel.dispose();
  }
}
