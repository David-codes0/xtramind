import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_comp_model.dart';
export 'loading_comp_model.dart';

class LoadingCompWidget extends StatefulWidget {
  const LoadingCompWidget({
    super.key,
    this.action,
  });

  final Future Function()? action;

  @override
  State<LoadingCompWidget> createState() => _LoadingCompWidgetState();
}

class _LoadingCompWidgetState extends State<LoadingCompWidget>
    with TickerProviderStateMixin {
  late LoadingCompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingCompModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.action?.call();
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 750.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: Color(0x39000000),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Icon(
          FFIcons.kgroup10577,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 100.0,
        ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
      ),
    );
  }
}
