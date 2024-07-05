// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeditationStruct extends FFFirebaseStruct {
  MeditationStruct({
    String? mediationName,
    String? meditationImage,
    String? meditationDuration,
    String? mediationCategory,
    String? meditationAudioUrl,
    double? meditationLikes,
    String? meditationDetail,
    String? meditationVoice,
    String? uid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mediationName = mediationName,
        _meditationImage = meditationImage,
        _meditationDuration = meditationDuration,
        _mediationCategory = mediationCategory,
        _meditationAudioUrl = meditationAudioUrl,
        _meditationLikes = meditationLikes,
        _meditationDetail = meditationDetail,
        _meditationVoice = meditationVoice,
        _uid = uid,
        super(firestoreUtilData);

  // "MediationName" field.
  String? _mediationName;
  String get mediationName => _mediationName ?? '';
  set mediationName(String? val) => _mediationName = val;

  bool hasMediationName() => _mediationName != null;

  // "MeditationImage" field.
  String? _meditationImage;
  String get meditationImage => _meditationImage ?? '';
  set meditationImage(String? val) => _meditationImage = val;

  bool hasMeditationImage() => _meditationImage != null;

  // "MeditationDuration" field.
  String? _meditationDuration;
  String get meditationDuration => _meditationDuration ?? '';
  set meditationDuration(String? val) => _meditationDuration = val;

  bool hasMeditationDuration() => _meditationDuration != null;

  // "MediationCategory" field.
  String? _mediationCategory;
  String get mediationCategory => _mediationCategory ?? '';
  set mediationCategory(String? val) => _mediationCategory = val;

  bool hasMediationCategory() => _mediationCategory != null;

  // "MeditationAudioUrl" field.
  String? _meditationAudioUrl;
  String get meditationAudioUrl => _meditationAudioUrl ?? '';
  set meditationAudioUrl(String? val) => _meditationAudioUrl = val;

  bool hasMeditationAudioUrl() => _meditationAudioUrl != null;

  // "MeditationLikes" field.
  double? _meditationLikes;
  double get meditationLikes => _meditationLikes ?? 0.0;
  set meditationLikes(double? val) => _meditationLikes = val;

  void incrementMeditationLikes(double amount) =>
      meditationLikes = meditationLikes + amount;

  bool hasMeditationLikes() => _meditationLikes != null;

  // "MeditationDetail" field.
  String? _meditationDetail;
  String get meditationDetail => _meditationDetail ?? '';
  set meditationDetail(String? val) => _meditationDetail = val;

  bool hasMeditationDetail() => _meditationDetail != null;

  // "MeditationVoice" field.
  String? _meditationVoice;
  String get meditationVoice => _meditationVoice ?? '';
  set meditationVoice(String? val) => _meditationVoice = val;

  bool hasMeditationVoice() => _meditationVoice != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  static MeditationStruct fromMap(Map<String, dynamic> data) =>
      MeditationStruct(
        mediationName: data['MediationName'] as String?,
        meditationImage: data['MeditationImage'] as String?,
        meditationDuration: data['MeditationDuration'] as String?,
        mediationCategory: data['MediationCategory'] as String?,
        meditationAudioUrl: data['MeditationAudioUrl'] as String?,
        meditationLikes: castToType<double>(data['MeditationLikes']),
        meditationDetail: data['MeditationDetail'] as String?,
        meditationVoice: data['MeditationVoice'] as String?,
        uid: data['uid'] as String?,
      );

  static MeditationStruct? maybeFromMap(dynamic data) => data is Map
      ? MeditationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'MediationName': _mediationName,
        'MeditationImage': _meditationImage,
        'MeditationDuration': _meditationDuration,
        'MediationCategory': _mediationCategory,
        'MeditationAudioUrl': _meditationAudioUrl,
        'MeditationLikes': _meditationLikes,
        'MeditationDetail': _meditationDetail,
        'MeditationVoice': _meditationVoice,
        'uid': _uid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'MediationName': serializeParam(
          _mediationName,
          ParamType.String,
        ),
        'MeditationImage': serializeParam(
          _meditationImage,
          ParamType.String,
        ),
        'MeditationDuration': serializeParam(
          _meditationDuration,
          ParamType.String,
        ),
        'MediationCategory': serializeParam(
          _mediationCategory,
          ParamType.String,
        ),
        'MeditationAudioUrl': serializeParam(
          _meditationAudioUrl,
          ParamType.String,
        ),
        'MeditationLikes': serializeParam(
          _meditationLikes,
          ParamType.double,
        ),
        'MeditationDetail': serializeParam(
          _meditationDetail,
          ParamType.String,
        ),
        'MeditationVoice': serializeParam(
          _meditationVoice,
          ParamType.String,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
      }.withoutNulls;

  static MeditationStruct fromSerializableMap(Map<String, dynamic> data) =>
      MeditationStruct(
        mediationName: deserializeParam(
          data['MediationName'],
          ParamType.String,
          false,
        ),
        meditationImage: deserializeParam(
          data['MeditationImage'],
          ParamType.String,
          false,
        ),
        meditationDuration: deserializeParam(
          data['MeditationDuration'],
          ParamType.String,
          false,
        ),
        mediationCategory: deserializeParam(
          data['MediationCategory'],
          ParamType.String,
          false,
        ),
        meditationAudioUrl: deserializeParam(
          data['MeditationAudioUrl'],
          ParamType.String,
          false,
        ),
        meditationLikes: deserializeParam(
          data['MeditationLikes'],
          ParamType.double,
          false,
        ),
        meditationDetail: deserializeParam(
          data['MeditationDetail'],
          ParamType.String,
          false,
        ),
        meditationVoice: deserializeParam(
          data['MeditationVoice'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MeditationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MeditationStruct &&
        mediationName == other.mediationName &&
        meditationImage == other.meditationImage &&
        meditationDuration == other.meditationDuration &&
        mediationCategory == other.mediationCategory &&
        meditationAudioUrl == other.meditationAudioUrl &&
        meditationLikes == other.meditationLikes &&
        meditationDetail == other.meditationDetail &&
        meditationVoice == other.meditationVoice &&
        uid == other.uid;
  }

  @override
  int get hashCode => const ListEquality().hash([
        mediationName,
        meditationImage,
        meditationDuration,
        mediationCategory,
        meditationAudioUrl,
        meditationLikes,
        meditationDetail,
        meditationVoice,
        uid
      ]);
}

MeditationStruct createMeditationStruct({
  String? mediationName,
  String? meditationImage,
  String? meditationDuration,
  String? mediationCategory,
  String? meditationAudioUrl,
  double? meditationLikes,
  String? meditationDetail,
  String? meditationVoice,
  String? uid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MeditationStruct(
      mediationName: mediationName,
      meditationImage: meditationImage,
      meditationDuration: meditationDuration,
      mediationCategory: mediationCategory,
      meditationAudioUrl: meditationAudioUrl,
      meditationLikes: meditationLikes,
      meditationDetail: meditationDetail,
      meditationVoice: meditationVoice,
      uid: uid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MeditationStruct? updateMeditationStruct(
  MeditationStruct? meditation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    meditation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMeditationStructData(
  Map<String, dynamic> firestoreData,
  MeditationStruct? meditation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (meditation == null) {
    return;
  }
  if (meditation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && meditation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final meditationData = getMeditationFirestoreData(meditation, forFieldValue);
  final nestedData = meditationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = meditation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMeditationFirestoreData(
  MeditationStruct? meditation, [
  bool forFieldValue = false,
]) {
  if (meditation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(meditation.toMap());

  // Add any Firestore field values
  meditation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMeditationListFirestoreData(
  List<MeditationStruct>? meditations,
) =>
    meditations?.map((e) => getMeditationFirestoreData(e, true)).toList() ?? [];
