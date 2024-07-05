import '/components/premium_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'premium_page_widget.dart' show PremiumPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PremiumPageModel extends FlutterFlowModel<PremiumPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for premiumCard component.
  late PremiumCardModel premiumCardModel1;
  // Model for premiumCard component.
  late PremiumCardModel premiumCardModel2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;

  @override
  void initState(BuildContext context) {
    premiumCardModel1 = createModel(context, () => PremiumCardModel());
    premiumCardModel2 = createModel(context, () => PremiumCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    premiumCardModel1.dispose();
    premiumCardModel2.dispose();
  }
}
