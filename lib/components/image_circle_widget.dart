import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'image_circle_model.dart';
export 'image_circle_model.dart';

class ImageCircleWidget extends StatefulWidget {
  const ImageCircleWidget({
    super.key,
    required this.gradientCircleDiameter,
    required this.blackCircleDiamter,
    Color? color,
  }) : this.color = color ?? Colors.black;

  final double? gradientCircleDiameter;
  final double? blackCircleDiamter;
  final Color color;

  @override
  State<ImageCircleWidget> createState() => _ImageCircleWidgetState();
}

class _ImageCircleWidgetState extends State<ImageCircleWidget> {
  late ImageCircleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageCircleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.gradientCircleDiameter,
      height: widget.gradientCircleDiameter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).primary,
            FlutterFlowTheme.of(context).secondary
          ],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
        shape: BoxShape.circle,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          width: widget.blackCircleDiamter,
          height: widget.blackCircleDiamter,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
