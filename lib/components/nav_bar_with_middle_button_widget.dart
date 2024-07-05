import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_with_middle_button_model.dart';
export 'nav_bar_with_middle_button_model.dart';

class NavBarWithMiddleButtonWidget extends StatefulWidget {
  const NavBarWithMiddleButtonWidget({super.key});

  @override
  State<NavBarWithMiddleButtonWidget> createState() =>
      _NavBarWithMiddleButtonWidgetState();
}

class _NavBarWithMiddleButtonWidgetState
    extends State<NavBarWithMiddleButtonWidget> {
  late NavBarWithMiddleButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarWithMiddleButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 90.0,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Color(0x1A57636C),
                        offset: Offset(
                          0.0,
                          -10.0,
                        ),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().navBarIndex = 1;
                  FFAppState().update(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      icon: Icon(
                        Icons.search_sharp,
                        color: FFAppState().navBarIndex == 1
                            ? Color(0xFF02A4F4)
                            : FlutterFlowTheme.of(context).primaryText,
                        size: 27.0,
                      ),
                      onPressed: () async {
                        FFAppState().navBarIndex = 1;
                        FFAppState().update(() {});
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                      child: Text(
                        'Search',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FFAppState().navBarIndex == 1
                                  ? Color(0xFF02A4F4)
                                  : FlutterFlowTheme.of(context).primaryText,
                              fontSize:
                                  FFAppState().navBarIndex == 1 ? 13.0 : 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().navBarIndex = 2;
                  FFAppState().update(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      icon: Icon(
                        Icons.star_border,
                        color: FFAppState().navBarIndex == 2
                            ? Color(0xFF02A4F4)
                            : FlutterFlowTheme.of(context).primaryText,
                        size: 27.0,
                      ),
                      onPressed: () async {
                        FFAppState().navBarIndex = 2;
                        FFAppState().update(() {});
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                      child: Text(
                        'Favourite',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FFAppState().navBarIndex == 2
                                  ? Color(0xFF02A4F4)
                                  : FlutterFlowTheme.of(context).primaryText,
                              fontSize:
                                  FFAppState().navBarIndex == 2 ? 13.0 : 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().navBarIndex = 0;
                  FFAppState().update(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          FFAppState().navBarIndex = 0;
                          FFAppState().update(() {});
                        },
                        child: Container(
                          width: 60.0,
                          height: 60.0,
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
                          child: Icon(
                            FFIcons.kgroup10577,
                            color: FFAppState().navBarIndex == 0
                                ? Color(0xFF02A4F4)
                                : FlutterFlowTheme.of(context).primaryText,
                            size: 29.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                      child: Text(
                        'Meditation',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FFAppState().navBarIndex == 0
                                  ? Color(0xFF02A4F4)
                                  : FlutterFlowTheme.of(context).primaryText,
                              fontSize:
                                  FFAppState().navBarIndex == 0 ? 13.0 : 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().navBarIndex = 3;
                  FFAppState().update(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          FFIcons.kpath47471,
                          color: FFAppState().navBarIndex == 3
                              ? Color(0xFF02A4F4)
                              : FlutterFlowTheme.of(context).primaryText,
                          size: 25.0,
                        ),
                        onPressed: () async {
                          FFAppState().navBarIndex = 3;
                          FFAppState().update(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                      child: Text(
                        'Premium',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FFAppState().navBarIndex == 3
                                  ? Color(0xFF02A4F4)
                                  : FlutterFlowTheme.of(context).primaryText,
                              fontSize:
                                  FFAppState().navBarIndex == 3 ? 13.0 : 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().navBarIndex = 4;
                  FFAppState().update(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      icon: Icon(
                        FFIcons.kgroup1866,
                        color: FFAppState().navBarIndex == 4
                            ? Color(0xFF02A4F4)
                            : FlutterFlowTheme.of(context).primaryText,
                        size: 27.0,
                      ),
                      onPressed: () async {
                        FFAppState().navBarIndex = 4;
                        FFAppState().update(() {});
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                      child: Text(
                        'Profile',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FFAppState().navBarIndex == 4
                                  ? Color(0xFF02A4F4)
                                  : FlutterFlowTheme.of(context).primaryText,
                              fontSize:
                                  FFAppState().navBarIndex == 4 ? 13.0 : 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
