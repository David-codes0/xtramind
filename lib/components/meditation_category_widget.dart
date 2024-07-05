import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meditation_category_model.dart';
export 'meditation_category_model.dart';

class MeditationCategoryWidget extends StatefulWidget {
  const MeditationCategoryWidget({
    super.key,
    required this.meditationCategory,
    this.categoryImage,
  });

  final String? meditationCategory;
  final String? categoryImage;

  @override
  State<MeditationCategoryWidget> createState() =>
      _MeditationCategoryWidgetState();
}

class _MeditationCategoryWidgetState extends State<MeditationCategoryWidget> {
  late MeditationCategoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationCategoryModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: 75.0,
        decoration: BoxDecoration(
          color: Color(0xFF151517),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        widget.categoryImage!,
                        width: MediaQuery.sizeOf(context).width * 0.15,
                        height: 67.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: Text(
                      widget.meditationCategory!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
