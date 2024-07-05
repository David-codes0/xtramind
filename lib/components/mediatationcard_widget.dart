import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mediatationcard_model.dart';
export 'mediatationcard_model.dart';

class MediatationcardWidget extends StatefulWidget {
  const MediatationcardWidget({
    super.key,
    required this.meditationName,
    required this.meditationDuration,
    required this.paidStatus,
    required this.meditationVoice,
    required this.numberofLikes,
    required this.isFavourite,
    Color? starcolor,
    Color? likecolor,
    this.favouriteAction,
    this.meditationImage,
    this.likeAction,
    this.meditationRef,
  })  : this.starcolor = starcolor ?? const Color(0xFFE6E7F2),
        this.likecolor = likecolor ?? const Color(0xFFE6E7F2);

  final String? meditationName;
  final String? meditationDuration;
  final bool? paidStatus;
  final String? meditationVoice;
  final String? numberofLikes;
  final bool? isFavourite;
  final Color starcolor;
  final Color likecolor;
  final Future Function()? favouriteAction;
  final String? meditationImage;
  final Future Function()? likeAction;
  final DocumentReference? meditationRef;

  @override
  State<MediatationcardWidget> createState() => _MediatationcardWidgetState();
}

class _MediatationcardWidgetState extends State<MediatationcardWidget> {
  late MediatationcardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MediatationcardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: StreamBuilder<MediationsRecord>(
          stream: MediationsRecord.getDocument(widget.meditationRef!),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            final containerMediationsRecord = snapshot.data!;
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (containerMediationsRecord.isLocked) {
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            content: Text(
                                'Do you want to show Ads to play meditation'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('Confirm'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    _model.interstitialAdSuccess =
                        await admob.showInterstitialAd();

                    if (_model.interstitialAdSuccess!) {
                      admob.loadInterstitialAd(
                        "ca-app-pub-3940256099942544/4411468910",
                        "ca-app-pub-3940256099942544/1033173712",
                        true,
                      );

                      context.pushNamed(
                        'meditationPlayerPage',
                        queryParameters: {
                          'meditationAudioUrl': serializeParam(
                            containerMediationsRecord.meditationAudioUrl,
                            ParamType.String,
                          ),
                          'mediationImage': serializeParam(
                            containerMediationsRecord.meditationImage,
                            ParamType.String,
                          ),
                          'meditationMinutes': serializeParam(
                            widget.meditationDuration,
                            ParamType.String,
                          ),
                          'mediationName': serializeParam(
                            containerMediationsRecord.mediationName,
                            ParamType.String,
                          ),
                          'meditationRef': serializeParam(
                            containerMediationsRecord.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Ads Failed',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'please accept ads to play meditation',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  }
                } else {
                  context.pushNamed(
                    'meditationPlayerPage',
                    queryParameters: {
                      'meditationAudioUrl': serializeParam(
                        containerMediationsRecord.meditationAudioUrl,
                        ParamType.String,
                      ),
                      'mediationImage': serializeParam(
                        containerMediationsRecord.meditationImage,
                        ParamType.String,
                      ),
                      'meditationMinutes': serializeParam(
                        containerMediationsRecord.meditationDuration,
                        ParamType.String,
                      ),
                      'mediationName': serializeParam(
                        containerMediationsRecord.mediationName,
                        ParamType.String,
                      ),
                      'meditationRef': serializeParam(
                        containerMediationsRecord.reference,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                  );
                }

                setState(() {});
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.5, 7.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 30.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.2,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xBC000000),
                                          FlutterFlowTheme.of(context)
                                              .secondaryText
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(-0.87, 1.0),
                                        end: AlignmentDirectional(0.87, -1.0),
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: Color(0xE4151517),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(
                                      containerMediationsRecord.meditationImage,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.3,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.16,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  if (widget.paidStatus ?? true)
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.3,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.16,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.7,
                              height: MediaQuery.sizeOf(context).height * 0.16,
                              decoration: BoxDecoration(
                                color: Color(0x27000000),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    13.0, 0.0, 0.0, 5.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              containerMediationsRecord
                                                  .mediationName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      80.0, 0.0, 10.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if ((currentUserDocument
                                                                ?.favouriteMeditatio
                                                                ?.toList() ??
                                                            [])
                                                        .contains(widget
                                                            .meditationRef)) {
                                                      await currentUserReference!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'favouriteMeditatio':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              widget
                                                                  .meditationRef
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    } else {
                                                      await currentUserReference!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'favouriteMeditatio':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              widget
                                                                  .meditationRef
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.star_sharp,
                                                    color: (currentUserDocument
                                                                    ?.favouriteMeditatio
                                                                    ?.toList() ??
                                                                [])
                                                            .contains(widget
                                                                .meditationRef)
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .warning
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          containerMediationsRecord
                                              .meditationDuration,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 9.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Container(
                                            width: 2.0,
                                            height: 2.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          containerMediationsRecord
                                              .meditationVoice,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 9.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 6.0, 12.0, 0.0),
                                        child: Text(
                                          'Make use of the natural power of deep breathing by taking two minutes off your busy day to relax and check in with your....',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 9.5,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          AuthUserStreamWidget(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if ((currentUserDocument
                                                            ?.likedMeditation
                                                            ?.toList() ??
                                                        [])
                                                    .contains(
                                                        widget.meditationRef)) {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'likedMeditation':
                                                            FieldValue
                                                                .arrayRemove([
                                                          widget.meditationRef
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  await containerMediationsRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'MeditationLikes':
                                                            FieldValue
                                                                .increment(
                                                                    -(1)),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'likedMeditation':
                                                            FieldValue
                                                                .arrayUnion([
                                                          widget.meditationRef
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  await containerMediationsRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'MeditationLikes':
                                                            FieldValue
                                                                .increment(1),
                                                      },
                                                    ),
                                                  });
                                                }
                                              },
                                              child: Icon(
                                                Icons.favorite,
                                                color: (currentUserDocument
                                                                ?.likedMeditation
                                                                ?.toList() ??
                                                            [])
                                                        .contains(widget
                                                            .meditationRef)
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              containerMediationsRecord
                                                  .meditationLikes
                                                  .toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 11.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Likes',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
