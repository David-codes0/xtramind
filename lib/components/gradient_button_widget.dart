import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gradient_button_model.dart';
export 'gradient_button_model.dart';

class GradientButtonWidget extends StatefulWidget {
  const GradientButtonWidget({
    super.key,
    required this.buttonName,
    required this.height,
    Color? textColor,
  }) : this.textColor = textColor ?? const Color(0xFFE0E3E7);

  final String? buttonName;
  final double? height;
  final Color textColor;

  @override
  State<GradientButtonWidget> createState() => _GradientButtonWidgetState();
}

class _GradientButtonWidgetState extends State<GradientButtonWidget> {
  late GradientButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GradientButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: widget.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF02A4F4), Color(0xFF751DFF)],
            stops: [0.0, 0.9],
            begin: AlignmentDirectional(0.03, 1.0),
            end: AlignmentDirectional(-0.03, -1.0),
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            widget.buttonName!,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: widget.textColor,
                  fontSize: 21.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w300,
                ),
          ),
        ),
      ),
    );
  }
}
