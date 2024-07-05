import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/loading_comp_widget.dart';
import '/components/mediatationcard_widget.dart';
import '/components/meditation_category_widget.dart';
import '/components/menu_drawer_widget.dart';
import '/components/nav_bar_with_middle_button_widget.dart';
import '/components/premium_card_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/admob_util.dart' as admob;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.forAdmobTimer();

      admob.loadInterstitialAd(
        "ca-app-pub-3940256099942544/4411468910",
        "ca-app-pub-3940256099942544/1033173712",
        true,
      );
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 1,
    )..addListener(() => setState(() {}));
    _model.textController ??=
        TextEditingController(text: ' Search Meditation....');
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
        drawer: Drawer(
          elevation: 16.0,
          child: Container(
            width: 100.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: wrapWithModel(
              model: _model.menuDrawerModel,
              updateCallback: () => setState(() {}),
              child: MenuDrawerWidget(),
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  if (FFAppState().navBarIndex == 0)
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Image_1.jpeg',
                              width: 300.0,
                              height: 150.0,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 98.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.03),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 60.0,
                                          icon: Icon(
                                            FFIcons.knounSideMenu5101039,
                                            color: Colors.white,
                                            size: 50.0,
                                          ),
                                          onPressed: () async {
                                            scaffoldKey.currentState!
                                                .openDrawer();
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                                  Container(
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Text(
                                            'Premium',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/Group_10823.png',
                                            width: 30.0,
                                            height: 30.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Container(
                            height: FFAppState().timerSwitch ? 70.0 : 63.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 95.0, 0.0, 0.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: TabBar(
                                    labelColor: Color(0xFF02A4F4),
                                    unselectedLabelColor: Color(0xFFD8D8D8),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                        ),
                                    unselectedLabelStyle: TextStyle(),
                                    indicatorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    padding: EdgeInsets.all(4.0),
                                    tabs: [
                                      Tab(
                                        text: 'POPULAR',
                                      ),
                                      Tab(
                                        text: 'CATEGORIES',
                                      ),
                                      Tab(
                                        text: 'ALL',
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [
                                        () async {},
                                        () async {},
                                        () async {}
                                      ][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      StreamBuilder<List<MediationsRecord>>(
                                        stream: queryMediationsRecord(
                                          queryBuilder: (mediationsRecord) =>
                                              mediationsRecord.where(
                                            'MeditationLikes',
                                            isGreaterThanOrEqualTo:
                                                _model.highestlikes,
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: LoadingCompWidget(
                                                action: () async {},
                                              ),
                                            );
                                          }
                                          List<MediationsRecord>
                                              containerMediationsRecordList =
                                              snapshot.data!;
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final popularMeds =
                                                    containerMediationsRecordList
                                                        .toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: popularMeds.length,
                                                  itemBuilder: (context,
                                                      popularMedsIndex) {
                                                    final popularMedsItem =
                                                        popularMeds[
                                                            popularMedsIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          MediatationcardWidget(
                                                        key: Key(
                                                            'Keynfk_${popularMedsIndex}_of_${popularMeds.length}'),
                                                        meditationName:
                                                            popularMedsItem
                                                                .mediationName,
                                                        meditationDuration:
                                                            popularMedsItem
                                                                .meditationDuration,
                                                        paidStatus: true,
                                                        meditationVoice:
                                                            popularMedsItem
                                                                .meditationVoice,
                                                        numberofLikes:
                                                            popularMedsItem
                                                                .meditationLikes
                                                                .toString(),
                                                        isFavourite: true,
                                                        starcolor:
                                                            Color(0xFFE6E7F2),
                                                        meditationImage:
                                                            popularMedsItem
                                                                .meditationImage,
                                                        meditationRef:
                                                            popularMedsItem
                                                                .reference,
                                                        favouriteAction:
                                                            () async {},
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
                                      ListView(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 0.0, 0.0),
                                              child: Text(
                                                'Daily Meditation',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 0.0),
                                            child: StreamBuilder<
                                                List<MediationsRecord>>(
                                              stream: queryMediationsRecord(
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<MediationsRecord>
                                                    mediatationcardMediationsRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final mediatationcardMediationsRecord =
                                                    mediatationcardMediationsRecordList
                                                            .isNotEmpty
                                                        ? mediatationcardMediationsRecordList
                                                            .first
                                                        : null;
                                                return wrapWithModel(
                                                  model: _model
                                                      .mediatationcardModel2,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: MediatationcardWidget(
                                                    meditationName:
                                                        mediatationcardMediationsRecord!
                                                            .mediationName,
                                                    meditationDuration:
                                                        '10 minutes',
                                                    paidStatus: true,
                                                    meditationVoice:
                                                        mediatationcardMediationsRecord!
                                                            .meditationVoice,
                                                    numberofLikes:
                                                        mediatationcardMediationsRecord!
                                                            .meditationLikes
                                                            .toString(),
                                                    isFavourite: true,
                                                    meditationImage:
                                                        mediatationcardMediationsRecord
                                                            ?.meditationImage,
                                                    meditationRef:
                                                        mediatationcardMediationsRecord
                                                            ?.reference,
                                                    favouriteAction: () async {
                                                      await FavioriteUserMeditationRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              createFavioriteUserMeditationRecordData(
                                                            userId:
                                                                currentUserUid,
                                                            mediation:
                                                                createMeditationStruct(
                                                              mediationName:
                                                                  'MeditationVoice',
                                                              meditationImage:
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/xtra-mind-4kpvtc/assets/23nekua10f60/Image_6.png',
                                                              meditationDuration:
                                                                  '10 minutes',
                                                              mediationCategory:
                                                                  'Manifest Anything',
                                                              meditationAudioUrl:
                                                                  'https://doc-00-44-docs.googleusercontent.com/docs/securesc/25qv168trkuc2hs1dlc07otp9onsb05p/em57uvcc65aegjrfahk7ovpd046s7d0a/1690029825000/07401927826371153841/07401927826371153841/1M8NTa_fTfJSabJN2OShEPzGXOE-L8_DZ?e=download&ax=AGtFMPVLScA_0-ih5Kqq1H8tTNfuxm0EOyzjf0S0iIdrqADSJrv25P_tIbGoMVmM8WHyTdhxxtzocJi9APxqPZrZRzI_4AHmXzIfIQBmzMr46lU1nlV1ryD_PPbclhT3tcH2fm7fKZMeIp6cJrr5vdhTTTXyzgMdcIbzLLxP-XexgQ3UMuWED6EbI9U8jTQPAfBzM6i6NPRxQbAkGGY5kVLwVavE_zHIFAuvKyjGodoLsZOFHdqyiMeQqNzcc3Tee9doBQe8j4lCRtW06slmm8GOugKKDy5IaBe7lzJaQlq1C12q5acp41YmGjeIuX6DLIQwb2Oe2W7nw57mSXlq-Q8_2IwpAW2hn4dGFXVuCDc7IqEEf09roZ-zo_Svrb5si45wuiHiH8VQBOqTcPmjliByHAyTTJYWQyphYILqafHtk-vxnbpYdcEJ_1xTpkrUxcxsVzhRuelRHLylvCTT9_aTLJZSxJXUDGCrRDSm_t7j0SiKd-ZKqQ0hd9nAVDy6W9pBXT4H-9YXA1Puxns6TyjyYrmYe02hQvK3qiZAM-_Hc5ch8chWXOCwbO3-hI7sPCgdfm2vYZpGSjWuFzv9Jah0siynRteNSNTRDGwh1AViPSpYqd701WCAR1wFkxPhBUGT_4xtAEa8YPnc4RiEnX3fRMmq_ci2lNlbZshe0ButRsi8M2KL3cnHHmos-N_4h5Jl6hw1jXD8tpKihj4dK2OPwPXBg-5FrM93aIDWOZyYZbtChPinXDwSQVMy9w4YOgnJUG8IKuTeOlMQbUu269lsSAkY2oX31nJw9UNC_alcAUR5rHeU7ZFVpRDCBkVHAMHAvSO8iIi45oPEt38hyy8wr1U2jFOtEm9SZGsnGhhU2KThBKxpHyUJ6DDDpf8J2apsew&uuid=5dba9bb9-6598-4dd6-9ca1-d7a80547b178&authuser=0',
                                                              meditationLikes:
                                                                  1134.0,
                                                              meditationDetail:
                                                                  'Clear your energy centers. So that your body mind and spirit are aligned. This helps o have better sleep and release.. ',
                                                              meditationVoice:
                                                                  'Male Voice',
                                                              clearUnsetFields:
                                                                  false,
                                                              create: true,
                                                            ),
                                                            meditation:
                                                                mediatationcardMediationsRecord
                                                                    ?.reference,
                                                          ));
                                                    },
                                                    likeAction: () async {},
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          StreamBuilder<
                                              List<MeditationCategoryRecord>>(
                                            stream:
                                                queryMeditationCategoryRecord(),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<MeditationCategoryRecord>
                                                  containerMeditationCategoryRecordList =
                                                  snapshot.data!;
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    final meditationCateDocs =
                                                        containerMeditationCategoryRecordList
                                                            .toList();
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: List.generate(
                                                          meditationCateDocs
                                                              .length,
                                                          (meditationCateDocsIndex) {
                                                        final meditationCateDocsItem =
                                                            meditationCateDocs[
                                                                meditationCateDocsIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'newMeditationPage',
                                                                queryParameters:
                                                                    {
                                                                  'meditationCategory':
                                                                      serializeParam(
                                                                    meditationCateDocsItem
                                                                        .categoryName,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child:
                                                                MeditationCategoryWidget(
                                                              key: Key(
                                                                  'Keynu5_${meditationCateDocsIndex}_of_${meditationCateDocs.length}'),
                                                              meditationCategory:
                                                                  meditationCateDocsItem
                                                                      .categoryName,
                                                              categoryImage:
                                                                  meditationCateDocsItem
                                                                      .categoryImage,
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      StreamBuilder<List<MediationsRecord>>(
                                        stream: queryMediationsRecord(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return LoadingCompWidget(
                                              action: () async {},
                                            );
                                          }
                                          List<MediationsRecord>
                                              containerMediationsRecordList =
                                              snapshot.data!;
                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final allMedDocs =
                                                    containerMediationsRecordList
                                                        .toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: allMedDocs.length,
                                                  itemBuilder: (context,
                                                      allMedDocsIndex) {
                                                    final allMedDocsItem =
                                                        allMedDocs[
                                                            allMedDocsIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          MediatationcardWidget(
                                                        key: Key(
                                                            'Key2h5_${allMedDocsIndex}_of_${allMedDocs.length}'),
                                                        meditationName:
                                                            allMedDocsItem
                                                                .mediationName,
                                                        meditationDuration:
                                                            allMedDocsItem
                                                                .meditationDuration,
                                                        paidStatus: true,
                                                        meditationVoice:
                                                            'Female Voice',
                                                        numberofLikes:
                                                            allMedDocsItem
                                                                .meditationLikes
                                                                .toString(),
                                                        isFavourite: true,
                                                        starcolor:
                                                            Color(0xFFE6E7F2),
                                                        meditationImage:
                                                            allMedDocsItem
                                                                .meditationImage,
                                                        meditationRef:
                                                            allMedDocsItem
                                                                .reference,
                                                        favouriteAction:
                                                            () async {
                                                          await FavioriteUserMeditationRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  createFavioriteUserMeditationRecordData(
                                                                userId:
                                                                    currentUserUid,
                                                                mediation:
                                                                    createMeditationStruct(
                                                                  mediationName:
                                                                      'MeditationVoice',
                                                                  meditationImage:
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/xtra-mind-4kpvtc/assets/23nekua10f60/Image_6.png',
                                                                  meditationDuration:
                                                                      '10 minutes',
                                                                  mediationCategory:
                                                                      'Manifest Anything',
                                                                  meditationAudioUrl:
                                                                      'https://doc-00-44-docs.googleusercontent.com/docs/securesc/25qv168trkuc2hs1dlc07otp9onsb05p/em57uvcc65aegjrfahk7ovpd046s7d0a/1690029825000/07401927826371153841/07401927826371153841/1M8NTa_fTfJSabJN2OShEPzGXOE-L8_DZ?e=download&ax=AGtFMPVLScA_0-ih5Kqq1H8tTNfuxm0EOyzjf0S0iIdrqADSJrv25P_tIbGoMVmM8WHyTdhxxtzocJi9APxqPZrZRzI_4AHmXzIfIQBmzMr46lU1nlV1ryD_PPbclhT3tcH2fm7fKZMeIp6cJrr5vdhTTTXyzgMdcIbzLLxP-XexgQ3UMuWED6EbI9U8jTQPAfBzM6i6NPRxQbAkGGY5kVLwVavE_zHIFAuvKyjGodoLsZOFHdqyiMeQqNzcc3Tee9doBQe8j4lCRtW06slmm8GOugKKDy5IaBe7lzJaQlq1C12q5acp41YmGjeIuX6DLIQwb2Oe2W7nw57mSXlq-Q8_2IwpAW2hn4dGFXVuCDc7IqEEf09roZ-zo_Svrb5si45wuiHiH8VQBOqTcPmjliByHAyTTJYWQyphYILqafHtk-vxnbpYdcEJ_1xTpkrUxcxsVzhRuelRHLylvCTT9_aTLJZSxJXUDGCrRDSm_t7j0SiKd-ZKqQ0hd9nAVDy6W9pBXT4H-9YXA1Puxns6TyjyYrmYe02hQvK3qiZAM-_Hc5ch8chWXOCwbO3-hI7sPCgdfm2vYZpGSjWuFzv9Jah0siynRteNSNTRDGwh1AViPSpYqd701WCAR1wFkxPhBUGT_4xtAEa8YPnc4RiEnX3fRMmq_ci2lNlbZshe0ButRsi8M2KL3cnHHmos-N_4h5Jl6hw1jXD8tpKihj4dK2OPwPXBg-5FrM93aIDWOZyYZbtChPinXDwSQVMy9w4YOgnJUG8IKuTeOlMQbUu269lsSAkY2oX31nJw9UNC_alcAUR5rHeU7ZFVpRDCBkVHAMHAvSO8iIi45oPEt38hyy8wr1U2jFOtEm9SZGsnGhhU2KThBKxpHyUJ6DDDpf8J2apsew&uuid=5dba9bb9-6598-4dd6-9ca1-d7a80547b178&authuser=0',
                                                                  meditationLikes:
                                                                      1134.0,
                                                                  meditationDetail:
                                                                      'Clear your energy centers. So that your body mind and spirit are aligned. This helps o have better sleep and release.. ',
                                                                  meditationVoice:
                                                                      'Male Voice',
                                                                  clearUnsetFields:
                                                                      false,
                                                                  create: true,
                                                                ),
                                                                meditation:
                                                                    allMedDocsItem
                                                                        .reference,
                                                              ));
                                                        },
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (FFAppState().navBarIndex == 1)
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Image_1.jpeg',
                              width: 300.0,
                              height: 151.0,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.03),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    FFIcons.knounSideMenu5101039,
                                    color: Colors.white,
                                    size: 50.0,
                                  ),
                                  onPressed: () async {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                ),
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
                        Align(
                          alignment: AlignmentDirectional(-1.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 90.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.9,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.07,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE6E7F2),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                8.0, 0.0),
                                                    child: TextFormField(
                                                      controller:
                                                          _model.textController,
                                                      focusNode: _model
                                                          .textFieldFocusNode,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Gotham',
                                                                  color: Color(
                                                                      0xFF707070),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: Color(
                                                                0xFF707070),
                                                            letterSpacing: 0.0,
                                                          ),
                                                      validator: _model
                                                          .textControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 5.0, 20.0, 5.0),
                                                child: Container(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      end: AlignmentDirectional(
                                                          0, 1.0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await queryMediationsRecordOnce()
                                                          .then(
                                                            (records) => _model
                                                                    .simpleSearchResults =
                                                                TextSearch(
                                                              records
                                                                  .map(
                                                                    (record) =>
                                                                        TextSearchItem.fromTerms(
                                                                            record,
                                                                            [
                                                                          record
                                                                              .mediationName!
                                                                        ]),
                                                                  )
                                                                  .toList(),
                                                            )
                                                                    .search(_model
                                                                        .textController
                                                                        .text)
                                                                    .map((r) =>
                                                                        r.object)
                                                                    .toList(),
                                                          )
                                                          .onError((_, __) =>
                                                              _model.simpleSearchResults =
                                                                  [])
                                                          .whenComplete(() =>
                                                              setState(() {}));

                                                      _model.searchResulti =
                                                          true;
                                                    },
                                                    child: Icon(
                                                      Icons.search_sharp,
                                                      color: Color(0xFFD8D8D8),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (_model.searchResulti)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 30.0, 0.0, 0.0),
                                            child: Text(
                                              'Search Results!',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            Color(0xFF751DFF),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final searchResult = _model
                                                      .simpleSearchResults
                                                      .toList();
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        searchResult.length,
                                                        (searchResultIndex) {
                                                      final searchResultItem =
                                                          searchResult[
                                                              searchResultIndex];
                                                      return AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            MediatationcardWidget(
                                                          key: Key(
                                                              'Keyjej_${searchResultIndex}_of_${searchResult.length}'),
                                                          meditationName:
                                                              searchResultItem
                                                                  .mediationName,
                                                          meditationDuration:
                                                              searchResultItem
                                                                  .meditationDuration,
                                                          paidStatus: true,
                                                          meditationVoice:
                                                              searchResultItem
                                                                  .meditationVoice,
                                                          numberofLikes:
                                                              searchResultItem
                                                                  .meditationLikes
                                                                  .toString(),
                                                          isFavourite: false,
                                                          starcolor: (currentUserDocument
                                                                          ?.favouriteMeditatio
                                                                          ?.toList() ??
                                                                      [])
                                                                  .contains(searchResultItem
                                                                      .reference)
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .warning
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                          likecolor: (currentUserDocument
                                                                          ?.likedMeditation
                                                                          ?.toList() ??
                                                                      [])
                                                                  .contains(searchResultItem
                                                                      .reference)
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                          meditationImage:
                                                              searchResultItem
                                                                  .meditationImage,
                                                          meditationRef:
                                                              searchResultItem
                                                                  .reference,
                                                          favouriteAction:
                                                              () async {
                                                            if ((currentUserDocument
                                                                        ?.favouriteMeditatio
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    searchResultItem
                                                                        .reference)) {
                                                              await currentUserReference!
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'favouriteMeditatio':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      searchResultItem
                                                                          .reference
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
                                                                      searchResultItem
                                                                          .reference
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                            }
                                                          },
                                                          likeAction: () async {
                                                            if ((currentUserDocument
                                                                        ?.likedMeditation
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    searchResultItem
                                                                        .reference)) {
                                                              await currentUserReference!
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'likedMeditation':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      searchResultItem
                                                                          .reference
                                                                    ]),
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
                                                                      searchResultItem
                                                                          .reference
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                            }
                                                          },
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 5.0, 0.0, 5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Text(
                                                    'Most Liked',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  borderWidth: 0.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.favorite,
                                                    color: Color(0xFF02A4F4),
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          StreamBuilder<List<MediationsRecord>>(
                                            stream: queryMediationsRecord(
                                              queryBuilder:
                                                  (mediationsRecord) =>
                                                      mediationsRecord.where(
                                                'MeditationLikes',
                                                isGreaterThan: _model.mostLike,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<MediationsRecord>
                                                  columnMediationsRecordList =
                                                  snapshot.data!;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    columnMediationsRecordList
                                                        .length, (columnIndex) {
                                                  final columnMediationsRecord =
                                                      columnMediationsRecordList[
                                                          columnIndex];
                                                  return AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        MediatationcardWidget(
                                                      key: Key(
                                                          'Key181_${columnIndex}_of_${columnMediationsRecordList.length}'),
                                                      meditationName:
                                                          columnMediationsRecord
                                                              .mediationName,
                                                      meditationDuration:
                                                          columnMediationsRecord
                                                              .meditationDuration,
                                                      paidStatus: true,
                                                      meditationVoice:
                                                          columnMediationsRecord
                                                              .meditationVoice,
                                                      numberofLikes:
                                                          columnMediationsRecord
                                                              .meditationLikes
                                                              .toString(),
                                                      isFavourite: false,
                                                      starcolor: (currentUserDocument
                                                                      ?.favouriteMeditatio
                                                                      ?.toList() ??
                                                                  [])
                                                              .contains(
                                                                  columnMediationsRecord
                                                                      .reference)
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .warning
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      likecolor: (currentUserDocument
                                                                      ?.likedMeditation
                                                                      ?.toList() ??
                                                                  [])
                                                              .contains(
                                                                  columnMediationsRecord
                                                                      .reference)
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      meditationImage:
                                                          columnMediationsRecord
                                                              .meditationImage,
                                                      meditationRef:
                                                          columnMediationsRecord
                                                              .reference,
                                                      favouriteAction:
                                                          () async {
                                                        if ((currentUserDocument
                                                                    ?.favouriteMeditatio
                                                                    ?.toList() ??
                                                                [])
                                                            .contains(
                                                                columnMediationsRecord
                                                                    .reference)) {
                                                          await currentUserReference!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'favouriteMeditatio':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  columnMediationsRecord
                                                                      .reference
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
                                                                  columnMediationsRecord
                                                                      .reference
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                      },
                                                      likeAction: () async {
                                                        if ((currentUserDocument
                                                                    ?.likedMeditation
                                                                    ?.toList() ??
                                                                [])
                                                            .contains(
                                                                columnMediationsRecord
                                                                    .reference)) {
                                                          await currentUserReference!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'likedMeditation':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  columnMediationsRecord
                                                                      .reference
                                                                ]),
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
                                                                  columnMediationsRecord
                                                                      .reference
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (FFAppState().navBarIndex == 3)
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Image_1.jpeg',
                              width: 300.0,
                              height: 151.0,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.03),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    FFIcons.knounSideMenu5101039,
                                    color: Colors.white,
                                    size: 50.0,
                                  ),
                                  onPressed: () async {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                ),
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
                        Align(
                          alignment: AlignmentDirectional(-1.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 90.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.9,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 1.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.premiumCardModel1,
                                      updateCallback: () => setState(() {}),
                                      child: PremiumCardWidget(
                                        price: '€3.99',
                                        monthRate: 'MONTHLY',
                                        buyAction: () async {
                                          await MediationsRecord.collection
                                              .doc()
                                              .set(createMediationsRecordData(
                                                mediationName: 'Breath & Relax',
                                                mediationDetail:
                                                    'Make use of the natural power of deep breathing by taking two minutes off your  ',
                                                meditationDuration:
                                                    '10 minutes',
                                                meditationLikes: 1345,
                                                meditationAudioUrl: '',
                                                meditationImage: 'rts',
                                                mediationCategory:
                                                    'New meditation',
                                              ));
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 110.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            FlutterFlowTheme.of(context)
                                                .secondary
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Stack(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  15.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/Group_10715_(1).png',
                                                          width: 80.0,
                                                          height: 80.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        40.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        '€19.99',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              19.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: '/mo',
                                                                    style:
                                                                        TextStyle(),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        40.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '6 MONTHS',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Gotham',
                                                                    fontSize:
                                                                        17.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/Group_8_copy.png',
                                                                    width:
                                                                        170.0,
                                                                    height:
                                                                        33.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        53.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'MOST POPULAR',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: Color(
                                                                            0xFF02A4F4),
                                                                        fontSize:
                                                                            8.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
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
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.3,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Buy',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.premiumCardModel2,
                                      updateCallback: () => setState(() {}),
                                      child: PremiumCardWidget(
                                        price: '€34.99',
                                        monthRate: 'YEARLY',
                                        buyAction: () async {
                                          await MeditationCategoryRecord
                                              .collection
                                              .doc()
                                              .set(
                                                  createMeditationCategoryRecordData(
                                                categoryName: 'New Meditations',
                                                categoryImage: 'yuii',
                                              ));
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 20.0, 15.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'PREMIUM BENEFITS',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkboxValue1 ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .checkboxValue1 =
                                                          newValue!);
                                                    },
                                                    side: BorderSide(
                                                      width: 2,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                  ),
                                                ),
                                                Text(
                                                  'Remove All Adverts',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkboxValue2 ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .checkboxValue2 =
                                                          newValue!);
                                                    },
                                                    side: BorderSide(
                                                      width: 2,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                  ),
                                                ),
                                                Text(
                                                  'Unlock access to all app features & future releases',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkboxValue3 ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .checkboxValue3 =
                                                          newValue!);
                                                    },
                                                    side: BorderSide(
                                                      width: 2,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                  ),
                                                ),
                                                Text(
                                                  'Listen in Background',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (FFAppState().navBarIndex == 4)
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Image_1.jpeg',
                              width: 300.0,
                              height: 152.0,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.03),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    FFIcons.knounSideMenu5101039,
                                    color: Colors.white,
                                    size: 50.0,
                                  ),
                                  onPressed: () async {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                ),
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
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 80.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.9,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Container(
                                          width: 160.0,
                                          height: 160.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                FlutterFlowTheme.of(context)
                                                    .secondary
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 145.0,
                                              height: 145.0,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width: 130.0,
                                                  height: 130.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/Image_29.png',
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Text(
                                          'Jay170585',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 130.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                FlutterFlowTheme.of(context)
                                                    .secondary
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        FFIcons.kgroup10885,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 28.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'TOTAL TIME',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: '65  ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: 'mins',
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 2.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x4FFFFFFF),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        FFIcons.kgroup10884,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 28.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'TOTAL SESSION',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: '5',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 2.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x4FFFFFFF),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 20.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        FFIcons.kpath5677,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 28.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'TOTAL TIME',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: '5',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
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
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 15.0, 10.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 65.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF0F0F0F),
                                                Color(0xFF434343)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context
                                                  .pushNamed('editProfilePage');
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Edit Profile',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 0.0),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 15.0, 10.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 65.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF0F0F0F),
                                                Color(0xFF434343)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().navBarIndex = 3;
                                              FFAppState().update(() {});
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Premium Membership',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 17.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 30.0,
                                                      height: 30.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/Group_10823.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 0.0),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 20.0, 10.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 150.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: Color(0xFF36363A),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  20.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Plan Type',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Monthly',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  20.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Status',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 16.0,
                                                                  height: 16.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF50B54D),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                'Active',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  20.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Duration',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Visit Store For More Details',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Container(
                                                  width: 140.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    border: Border.all(
                                                      color: Color(0xFF36363A),
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      'PLAN DETAILS ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 15.0, 20.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 110.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF151517),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  15.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/Group_10715_(1).png',
                                                          width: 80.0,
                                                          height: 80.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        40.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'MONTHLY',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Gotham',
                                                                    fontSize:
                                                                        17.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.3,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF02A4F4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Buy',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 15.0, 20.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF1A1A1C),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            border: Border.all(
                                              color: Color(0xFFE83737),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'CANCEL MEMBERSHIP',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFFE83737),
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 30.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 40.0, 0.0),
                                              child: Container(
                                                width: 130.0,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF161617),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'DELETE ACCOUNT',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                GoRouter.of(context)
                                                    .prepareAuthEvent();
                                                await authManager.signOut();
                                                GoRouter.of(context)
                                                    .clearRedirectLocation();

                                                context.goNamedAuth(
                                                    'Login', context.mounted);
                                              },
                                              child: Container(
                                                width: 130.0,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF161617),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      GoRouter.of(context)
                                                          .prepareAuthEvent();
                                                      await authManager
                                                          .signOut();
                                                      GoRouter.of(context)
                                                          .clearRedirectLocation();

                                                      context.goNamedAuth(
                                                          'Login',
                                                          context.mounted);
                                                    },
                                                    child: Text(
                                                      'SIGN OUT',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            fontSize: 11.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (FFAppState().navBarIndex == 2)
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Image_1.jpeg',
                              width: 300.0,
                              height: 151.0,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.03),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    FFIcons.knounSideMenu5101039,
                                    color: Colors.white,
                                    size: 50.0,
                                  ),
                                  onPressed: () async {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                ),
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
                        Align(
                          alignment: AlignmentDirectional(-1.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 90.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.9,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        final favMedi = (currentUserDocument
                                                    ?.favouriteMeditatio
                                                    ?.toList() ??
                                                [])
                                            .map((e) => e)
                                            .toList();
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: favMedi.length,
                                          itemBuilder: (context, favMediIndex) {
                                            final favMediItem =
                                                favMedi[favMediIndex];
                                            return StreamBuilder<
                                                MediationsRecord>(
                                              stream:
                                                  MediationsRecord.getDocument(
                                                      favMediItem),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final mediatationcardMediationsRecord =
                                                    snapshot.data!;
                                                return MediatationcardWidget(
                                                  key: Key(
                                                      'Keydhd_${favMediIndex}_of_${favMedi.length}'),
                                                  meditationName:
                                                      favMediIndex.toString(),
                                                  meditationDuration: 'glkh;',
                                                  paidStatus: true,
                                                  meditationVoice:
                                                      favMediIndex.toString(),
                                                  numberofLikes: '1263',
                                                  isFavourite: false,
                                                  starcolor: Color(0xFFF2BC05),
                                                  meditationImage:
                                                      mediatationcardMediationsRecord
                                                          .meditationImage,
                                                  meditationRef: favMediItem,
                                                  favouriteAction: () async {
                                                    await actions
                                                        .emptyCustomAction();
                                                  },
                                                  likeAction: () async {},
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            if (!(isWeb
                ? MediaQuery.viewInsetsOf(context).bottom > 0
                : _isKeyboardVisible))
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (FFAppState().timerSwitch)
                    FlutterFlowAdBanner(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.04,
                      showsTestAd: true,
                      iOSAdUnitID: 'ca-app-pub-1761855375816044/9694813926',
                      androidAdUnitID: 'ca-app-pub-1761855375816044/8190160567',
                    ),
                  wrapWithModel(
                    model: _model.navBarWithMiddleButtonModel,
                    updateCallback: () => setState(() {}),
                    child: NavBarWithMiddleButtonWidget(),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
