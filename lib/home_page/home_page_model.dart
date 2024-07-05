import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/loading_comp_widget.dart';
import '/components/mediatationcard_widget.dart';
import '/components/meditation_category_widget.dart';
import '/components/menu_drawer_widget.dart';
import '/components/nav_bar_with_middle_button_widget.dart';
import '/components/premium_card_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/admob_util.dart' as admob;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  int? highestlikes = 1200;

  int mostLike = 1300;

  bool searchResulti = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for mediatationcard component.
  late MediatationcardModel mediatationcardModel2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<MediationsRecord> simpleSearchResults = [];
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
  // Model for NavBarWithMiddleButton component.
  late NavBarWithMiddleButtonModel navBarWithMiddleButtonModel;
  // Model for menuDrawer component.
  late MenuDrawerModel menuDrawerModel;

  @override
  void initState(BuildContext context) {
    mediatationcardModel2 = createModel(context, () => MediatationcardModel());
    premiumCardModel1 = createModel(context, () => PremiumCardModel());
    premiumCardModel2 = createModel(context, () => PremiumCardModel());
    navBarWithMiddleButtonModel =
        createModel(context, () => NavBarWithMiddleButtonModel());
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    mediatationcardModel2.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    premiumCardModel1.dispose();
    premiumCardModel2.dispose();
    navBarWithMiddleButtonModel.dispose();
    menuDrawerModel.dispose();
  }
}
