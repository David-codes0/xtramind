import '/backend/backend.dart';
import '/components/loading_comp_widget.dart';
import '/components/mediatationcard_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_meditation_page_model.dart';
export 'new_meditation_page_model.dart';

class NewMeditationPageWidget extends StatefulWidget {
  const NewMeditationPageWidget({
    super.key,
    required this.meditationCategory,
  });

  final String? meditationCategory;

  @override
  State<NewMeditationPageWidget> createState() =>
      _NewMeditationPageWidgetState();
}

class _NewMeditationPageWidgetState extends State<NewMeditationPageWidget> {
  late NewMeditationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewMeditationPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      admob.loadInterstitialAd(
        "ca-app-pub-1761855375816044/1171284009",
        "ca-app-pub-1761855375816044/9049774025",
        true,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Image_1.jpeg',
                        width: 300.0,
                        height: 125.0,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color(0xFF751DFF),
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/image_9.png',
                              width: 100.0,
                              height: 49.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 0.0, 10.0),
                                    child: Text(
                                      widget.meditationCategory!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                StreamBuilder<List<MediationsRecord>>(
                                  stream: queryMediationsRecord(
                                    queryBuilder: (mediationsRecord) =>
                                        mediationsRecord.where(
                                      'MediationCategory',
                                      isEqualTo: widget.meditationCategory,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.7,
                                          child: LoadingCompWidget(
                                            action: () async {},
                                          ),
                                        ),
                                      );
                                    }
                                    List<MediationsRecord>
                                        containerMediationsRecordList =
                                        snapshot.data!;
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          final meditationCategory =
                                              containerMediationsRecordList
                                                  .toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                meditationCategory.length,
                                            itemBuilder: (context,
                                                meditationCategoryIndex) {
                                              final meditationCategoryItem =
                                                  meditationCategory[
                                                      meditationCategoryIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.interstitialAdSuccess =
                                                      await admob
                                                          .showInterstitialAd();

                                                  setState(() {});
                                                },
                                                child: MediatationcardWidget(
                                                  key: Key(
                                                      'Keyw1d_${meditationCategoryIndex}_of_${meditationCategory.length}'),
                                                  meditationName:
                                                      'Breath & Relax',
                                                  meditationDuration:
                                                      '10 minutes',
                                                  paidStatus: true,
                                                  meditationVoice:
                                                      'Female Voice',
                                                  numberofLikes: '1263',
                                                  isFavourite: false,
                                                  meditationRef:
                                                      meditationCategoryItem
                                                          .reference,
                                                  favouriteAction: () async {},
                                                  likeAction: () async {},
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (FFAppState().timerSwitch)
                FlutterFlowAdBanner(
                  showsTestAd: true,
                  iOSAdUnitID: 'ca-app-pub-1761855375816044/9694813926',
                  androidAdUnitID: 'ca-app-pub-1761855375816044/8190160567',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
