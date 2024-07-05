import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _password = prefs.getString('ff_password') ?? _password;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _navBarIndex = 0;
  int get navBarIndex => _navBarIndex;
  set navBarIndex(int value) {
    _navBarIndex = value;
  }

  int _sideDrawerIndex = 14;
  int get sideDrawerIndex => _sideDrawerIndex;
  set sideDrawerIndex(int value) {
    _sideDrawerIndex = value;
  }

  bool _timerSwitch = false;
  bool get timerSwitch => _timerSwitch;
  set timerSwitch(bool value) {
    _timerSwitch = value;
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    prefs.setString('ff_password', value);
  }

  String _showSearchResult = '';
  String get showSearchResult => _showSearchResult;
  set showSearchResult(String value) {
    _showSearchResult = value;
  }

  List<DocumentReference> _favMeditation = [];
  List<DocumentReference> get favMeditation => _favMeditation;
  set favMeditation(List<DocumentReference> value) {
    _favMeditation = value;
  }

  void addToFavMeditation(DocumentReference value) {
    favMeditation.add(value);
  }

  void removeFromFavMeditation(DocumentReference value) {
    favMeditation.remove(value);
  }

  void removeAtIndexFromFavMeditation(int index) {
    favMeditation.removeAt(index);
  }

  void updateFavMeditationAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    favMeditation[index] = updateFn(_favMeditation[index]);
  }

  void insertAtIndexInFavMeditation(int index, DocumentReference value) {
    favMeditation.insert(index, value);
  }

  List<MeditationStruct> _favv = [];
  List<MeditationStruct> get favv => _favv;
  set favv(List<MeditationStruct> value) {
    _favv = value;
  }

  void addToFavv(MeditationStruct value) {
    favv.add(value);
  }

  void removeFromFavv(MeditationStruct value) {
    favv.remove(value);
  }

  void removeAtIndexFromFavv(int index) {
    favv.removeAt(index);
  }

  void updateFavvAtIndex(
    int index,
    MeditationStruct Function(MeditationStruct) updateFn,
  ) {
    favv[index] = updateFn(_favv[index]);
  }

  void insertAtIndexInFavv(int index, MeditationStruct value) {
    favv.insert(index, value);
  }

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  set isPlaying(bool value) {
    _isPlaying = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
