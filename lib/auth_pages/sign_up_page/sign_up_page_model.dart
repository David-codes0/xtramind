import '/auth/firebase_auth/auth_util.dart';
import '/components/gradient_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'sign_up_page_widget.dart' show SignUpPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPageModel extends FlutterFlowModel<SignUpPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  // State field(s) for passwprdTextField widget.
  FocusNode? passwprdTextFieldFocusNode;
  TextEditingController? passwprdTextFieldTextController;
  late bool passwprdTextFieldVisibility;
  String? Function(BuildContext, String?)?
      passwprdTextFieldTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Model for gradientButton component.
  late GradientButtonModel gradientButtonModel;

  @override
  void initState(BuildContext context) {
    passwprdTextFieldVisibility = false;
    gradientButtonModel = createModel(context, () => GradientButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    passwprdTextFieldFocusNode?.dispose();
    passwprdTextFieldTextController?.dispose();

    gradientButtonModel.dispose();
  }
}
