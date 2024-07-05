import '/auth/firebase_auth/auth_util.dart';
import '/components/gradient_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'forget_password_page_copy_widget.dart'
    show ForgetPasswordPageCopyWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgetPasswordPageCopyModel
    extends FlutterFlowModel<ForgetPasswordPageCopyWidget> {
  ///  Local state fields for this page.

  bool readonlyNickname = true;

  bool readOnlyEmail = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for passwordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldTextController;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextControllerValidator;
  // Model for gradientButton component.
  late GradientButtonModel gradientButtonModel;

  @override
  void initState(BuildContext context) {
    gradientButtonModel = createModel(context, () => GradientButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldTextController?.dispose();

    gradientButtonModel.dispose();
  }
}
