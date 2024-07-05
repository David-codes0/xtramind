// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../../flutter_flow/flutter_flow_icon_button.dart';

import 'dart:math' as math;

// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:xtra_mind/flutter_flow/flutter_flow_audio_player.dart';

class CustomAudioPlayer extends StatefulWidget {
  const CustomAudioPlayer({
    Key? key,
    this.width,
    this.height,
    this.forwardIcon,
    this.backwardIcon,
    this.audioUrl,
    this.action,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Widget? forwardIcon;
  final Widget? backwardIcon;
  final String? audioUrl;
  final Future<dynamic> Function()? action;

  @override
  _CustomAudioPlayerState createState() => _CustomAudioPlayerState();
}

class _CustomAudioPlayerState extends State<CustomAudioPlayer> {
  late Audio audio;

  bool isPlaying = false;
  // Duration duration = Duration.zero;
  Duration position = Duration.zero;
  AssetsAudioPlayer? _assetsAudioPlayer;
  bool ispPlaying = false;

  @override
  void initState() {
    super.initState();
    // setAudio();
    audio = Audio.network(
      widget.audioUrl!,
    );
    openPlayer();
    // audio.onPlayerStateChanged.listen((event) {
    //   setState(() {
    //     isPlaying = event == PlayerState.playing;
    //   });
    // });

    // audio.onDurationChanged.listen((event) {
    //   setState(() {
    //     duration = event;
    //   });
    // });

    // audio.onPositionChanged.listen((event) {
    //   setState(() {
    //     position = event;
    //   });
    // });
  }

  Future openPlayer() async {
    _assetsAudioPlayer ??=
        AssetsAudioPlayer.withId(generateRandomAlphaNumericString());
    if (_assetsAudioPlayer?.playlist != null) {
      _assetsAudioPlayer!.playlist!.replaceAt(0, (oldAudio) => audio);
    } else {
      await _assetsAudioPlayer!.open(
        Playlist(audios: [audio]),
        autoStart: false,
        playInBackground: PlayInBackground.enabled,
      );
    }
  }

  String generateRandomAlphaNumericString() {
    const chars = 'abcdefghijklmnopqrstuvwxyz1234567890';
    return String.fromCharCodes(Iterable.generate(
        8, (_) => chars.codeUnits[math.Random().nextInt(chars.length)]));
  }

  // Future setAudio() async {
  //   audio.play(UrlSource(
  //       'https://storage.googleapis.com/staging.xtra-mind-70d4b.appspot.com/1.%20Quick%20Powerful%20Guided%20Meditation%20Even%20Though%20You%20Are%20Busy%20at%20Work.mp3'));
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    _assetsAudioPlayer?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomAudioPlayer old) {
    super.didUpdateWidget(old);
    // final changed = audio.path != audio.path ||
    //     old.audio.audioType != audio.audioType;
    final isPlaying = _assetsAudioPlayer?.isPlaying.value ?? false;
    if (!isPlaying) {
      openPlayer();
    }
  }

  Duration currentPosition(RealtimePlayingInfos infos) => infos.currentPosition;
  Duration duration(RealtimePlayingInfos infos) => infos.duration;

  String durationToString(Duration duration) {
    String twoDigits(int n) => (n >= 10) ? '$n' : '0$n';

    final twoDigitMinutes = twoDigits(
        duration.inMinutes.remainder(Duration.minutesPerHour).toInt());
    final twoDigitSeconds = twoDigits(
        duration.inSeconds.remainder(Duration.secondsPerMinute).toInt());
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  String playbackStateText(RealtimePlayingInfos infos) {
    final currentPositionString = durationToString(currentPosition(infos));
    final durationString = durationToString(duration(infos));
    return '$currentPositionString/$durationString';
  }

  @override
  Widget build(BuildContext context) {
    void playPauseF() async {
      _assetsAudioPlayer!.playOrPause();

      ispPlaying = !ispPlaying;

      if (ispPlaying) {
        FFAppState().update(() {
          FFAppState().isPlaying = true;
        });
      } else {
        FFAppState().update(() {
          FFAppState().isPlaying = false;
        });
      }

      widget.action!.call();
      // print(FFAppState().isPlaying.toString() + isPlaying.toString());
    }

    return FlowAudioPlayer(
      audio: audio,
      backwardIcon: widget.backwardIcon!,
      forwardIcon: widget.forwardIcon!,
      action: () async {
        widget.action!.call();
      },
      playInBackground: PlayInBackground.enabled,
    );
  }
}

class FlutterFlowIconButton extends StatefulWidget {
  const FlutterFlowIconButton({
    Key? key,
    required this.icon,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.buttonSize,
    this.fillColor,
    this.disabledColor,
    this.disabledIconColor,
    this.hoverColor,
    this.hoverIconColor,
    this.onPressed,
    this.showLoadingIndicator = false,
  }) : super(key: key);

  final Widget icon;
  final double? borderRadius;
  final double? buttonSize;
  final Color? fillColor;
  final Color? disabledColor;
  final Color? disabledIconColor;
  final Color? hoverColor;
  final Color? hoverIconColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool showLoadingIndicator;
  final Function()? onPressed;

  @override
  State<FlutterFlowIconButton> createState() => _FlutterFlowIconButtonState();
}

class _FlutterFlowIconButtonState extends State<FlutterFlowIconButton> {
  bool loading = false;
  late double? iconSize;
  late Color? iconColor;
  late Widget effectiveIcon;

  @override
  void initState() {
    super.initState();
    _updateIcon();
  }

  @override
  void didUpdateWidget(FlutterFlowIconButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateIcon();
  }

  void _updateIcon() {
    final isFontAwesome = widget.icon is FaIcon;
    if (isFontAwesome) {
      FaIcon icon = widget.icon as FaIcon;
      effectiveIcon = FaIcon(
        icon.icon,
        size: icon.size,
      );
      iconSize = icon.size;
      iconColor = icon.color;
    } else {
      Icon icon = widget.icon as Icon;
      effectiveIcon = Icon(
        icon.icon,
        size: icon.size,
      );
      iconSize = icon.size;
      iconColor = icon.color;
    }
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle style = ButtonStyle(
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
        (states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            side: BorderSide(
              color: widget.borderColor ?? Colors.transparent,
              width: widget.borderWidth ?? 0,
            ),
          );
        },
      ),
      iconColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled) &&
              widget.disabledIconColor != null) {
            return widget.disabledIconColor;
          }
          if (states.contains(MaterialState.hovered) &&
              widget.hoverIconColor != null) {
            return widget.hoverIconColor;
          }
          return iconColor;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled) &&
              widget.disabledColor != null) {
            return widget.disabledColor;
          }
          if (states.contains(MaterialState.hovered) &&
              widget.hoverColor != null) {
            return widget.hoverColor;
          }

          return widget.fillColor;
        },
      ),
    );

    return SizedBox(
      width: widget.buttonSize,
      height: widget.buttonSize,
      child: Theme(
        data: Theme.of(context).copyWith(useMaterial3: true),
        child: IgnorePointer(
          ignoring: (widget.showLoadingIndicator && loading),
          child: IconButton(
            icon: (widget.showLoadingIndicator && loading)
                ? Container(
                    width: iconSize,
                    height: iconSize,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        iconColor ?? Colors.white,
                      ),
                    ),
                  )
                : effectiveIcon,
            onPressed: widget.onPressed == null
                ? null
                : () async {
                    if (loading) {
                      return;
                    }
                    setState(() => loading = true);
                    try {
                      await widget.onPressed!();
                    } finally {
                      if (mounted) {
                        setState(() => loading = false);
                      }
                    }
                  },
            splashRadius: widget.buttonSize,
            style: style,
          ),
        ),
      ),
    );
  }
}

class FlowAudioPlayer extends StatefulWidget {
  const FlowAudioPlayer({
    required this.audio,
    this.pauseOnNavigate = true,
    required this.playInBackground,
    required this.backwardIcon,
    required this.forwardIcon,
    this.action,
  });

  final Audio audio;
  final Widget backwardIcon;
  final Widget forwardIcon;
  final bool pauseOnNavigate;
  final PlayInBackground playInBackground;
  final Future<dynamic> Function()? action;
  // final void Function()? action;

  @override
  _FlowAudioPlayerState createState() => _FlowAudioPlayerState();
}

class _FlowAudioPlayerState extends State<FlowAudioPlayer> with RouteAware {
  AssetsAudioPlayer? _assetsAudioPlayer;
  bool _subscribedRoute = false;
  bool ispPlaying = false;

  @override
  void initState() {
    super.initState();
    openPlayer();
  }

  Future openPlayer() async {
    _assetsAudioPlayer ??=
        AssetsAudioPlayer.withId(genRandomAlphaNumericString());
    if (_assetsAudioPlayer?.playlist != null) {
      _assetsAudioPlayer!.playlist!.replaceAt(0, (oldAudio) => widget.audio);
    } else {
      await _assetsAudioPlayer!.open(
        Playlist(audios: [widget.audio]),
        autoStart: false,
        playInBackground: widget.playInBackground,
      );
    }
  }

  @override
  void dispose() {
    if (_subscribedRoute) {
      // unsubscribe(this);
    }
    _assetsAudioPlayer?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FlowAudioPlayer old) {
    super.didUpdateWidget(old);
    final changed = old.audio.path != widget.audio.path ||
        old.audio.audioType != widget.audio.audioType;
    final isPlaying = _assetsAudioPlayer?.isPlaying.value ?? false;
    if (changed && !isPlaying) {
      openPlayer();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.pauseOnNavigate && ModalRoute.of(context) is PageRoute) {
      _subscribedRoute = true;
      // subscribe(this, ModalRoute.of(context)!);
    }
  }

  @override
  void didPushNext() {
    if (widget.pauseOnNavigate) {
      _assetsAudioPlayer?.pause();
    }
  }

  Duration currentPosition(RealtimePlayingInfos infos) => infos.currentPosition;
  Duration duration(RealtimePlayingInfos infos) => infos.duration;

  String playbackStateText(RealtimePlayingInfos infos) {
    final currentPositionString = durationToStr(currentPosition(infos));
    final durationString = durationToStr(duration(infos));
    return '$currentPositionString/$durationString';
  }

  @override
  Widget build(BuildContext context) {
    void playPauseF() async {
      _assetsAudioPlayer!.playOrPause();

      ispPlaying = !ispPlaying;

      if (ispPlaying) {
        FFAppState().update(() {
          FFAppState().isPlaying = true;
        });
      } else {
        FFAppState().update(() {
          FFAppState().isPlaying = false;
        });
      }

      widget.action!.call();
      // print(FFAppState().isPlaying.toString() + isPlaying.toString());
    }

    return _assetsAudioPlayer!.builderRealtimePlayingInfos(
        builder: (context, infos) => PlayerBuilder.isPlaying(
            player: _assetsAudioPlayer!,
            builder: (context, isPlaying) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 60.0, 5.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: widget.backwardIcon,
                              onPressed: () => _assetsAudioPlayer!.seekBy(
                                Duration(
                                  seconds: -15,
                                ),
                              ),
                            ),
                            Container(
                              width: 100.0,
                              height: 100.0,
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
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    shape: BoxShape.circle,
                                  ),
                                  child: GestureDetector(
                                    onTap: () => playPauseF(),
                                    // => widget.action.call,
                                    child: Icon(
                                      isPlaying
                                          ? Icons.pause_rounded
                                          : Icons.play_arrow_rounded,
                                      color: Color(0xFF3F414E),
                                      size: 60.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: widget.forwardIcon,
                              onPressed: () => _assetsAudioPlayer!
                                  .seekBy(Duration(seconds: 15)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.11,
                      ),
                      Container(
                        width: double.infinity,
                        child: PosSeekWidget(
                          currentPosition: currentPosition(infos),
                          duration: duration(infos),
                          seekTo: (to) {
                            _assetsAudioPlayer!.seek(to);
                          },
                          activeTrackColor: Colors.brown,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              durationToStr(currentPosition(infos)),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                  ),
                            ),
                            Text(
                              durationToStr(duration(infos)),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                  ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}

class PosSeekWidget extends StatefulWidget {
  const PosSeekWidget({
    required this.currentPosition,
    required this.duration,
    required this.seekTo,
    required this.activeTrackColor,
  });

  final Duration currentPosition;
  final Duration duration;
  final Function(Duration) seekTo;
  final Color activeTrackColor;

  @override
  _PosSeekWidgetState createState() => _PosSeekWidgetState();
}

class _PosSeekWidgetState extends State<PosSeekWidget> {
  late Duration _visibleValue;
  bool listenOnlyUserInteraction = false;
  double get percent => widget.duration.inMilliseconds == 0
      ? 0
      : _visibleValue.inMilliseconds / widget.duration.inMilliseconds;

  @override
  void initState() {
    super.initState();
    _visibleValue = widget.currentPosition;
  }

  @override
  void didUpdateWidget(PosSeekWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listenOnlyUserInteraction) {
      _visibleValue = widget.currentPosition;
    }
  }

  @override
  Widget build(BuildContext context) => Slider(
        min: 0,
        max: widget.duration.inMilliseconds.toDouble(),
        inactiveColor: Color(0xFF47557E),
        thumbColor: Color(0xFF8E97FD),
        activeColor: Color(0xFFE6E7F2),
        value:
            math.min(1.0, percent) * widget.duration.inMilliseconds.toDouble(),
        onChangeEnd: (newValue) => setState(() {
          listenOnlyUserInteraction = false;
          widget.seekTo(_visibleValue);
        }),
        onChangeStart: (_) => setState(() => listenOnlyUserInteraction = true),
        onChanged: (newValue) => setState(
            () => _visibleValue = Duration(milliseconds: newValue.floor())),
      );
}

String durationToStr(Duration duration) {
  String twoDigits(int n) => (n >= 10) ? '$n' : '0$n';

  final twoDigitMinutes =
      twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour).toInt());
  final twoDigitSeconds = twoDigits(
      duration.inSeconds.remainder(Duration.secondsPerMinute).toInt());
  return '$twoDigitMinutes:$twoDigitSeconds';
}

String genRandomAlphaNumericString() {
  const chars = 'abcdefghijklmnopqrstuvwxyz1234567890';
  return String.fromCharCodes(Iterable.generate(
      8, (_) => chars.codeUnits[math.Random().nextInt(chars.length)]));
}
