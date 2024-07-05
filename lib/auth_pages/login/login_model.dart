import '/auth/firebase_auth/auth_util.dart';
import '/components/gradient_button_widget.dart';
import '/components/loading_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  // State field(s) for passWordTextField widget.
  FocusNode? passWordTextFieldFocusNode;
  TextEditingController? passWordTextFieldTextController;
  late bool passWordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      passWordTextFieldTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Model for gradientButton component.
  late GradientButtonModel gradientButtonModel;

  @override
  void initState(BuildContext context) {
    passWordTextFieldVisibility = false;
    gradientButtonModel = createModel(context, () => GradientButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    passWordTextFieldFocusNode?.dispose();
    passWordTextFieldTextController?.dispose();

    gradientButtonModel.dispose();
  }
}
