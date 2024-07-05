// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserMeditationsStruct extends FFFirebaseStruct {
  UserMeditationsStruct({
    String? mediationName,
    String? meditationImage,
    String? meditationDuration,
    String? mediationCategory,
    String? meditationAudioUrl,
    double? meditationLikes,
    String? meditationDetail,
    String? meditationVoice,
    bool? isFavourite,
    bool? isLiked,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mediationName = mediationName,
        _meditationImage = meditationImage,
        _meditationDuration = meditationDuration,
        _mediationCategory = mediationCategory,
        _meditationAudioUrl = meditationAudioUrl,
        _meditationLikes = meditationLikes,
        _meditationDetail = meditationDetail,
        _meditationVoice = meditationVoice,
        _isFavourite = isFavourite,
        _isLiked = isLiked,
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

  // "isFavourite" field.
  bool? _isFavourite;
  bool get isFavourite => _isFavourite ?? false;
  set isFavourite(bool? val) => _isFavourite = val;

  bool hasIsFavourite() => _isFavourite != null;

  // "isLiked" field.
  bool? _isLiked;
  bool get isLiked => _isLiked ?? false;
  set isLiked(bool? val) => _isLiked = val;

  bool hasIsLiked() => _isLiked != null;

  static UserMeditationsStruct fromMap(Map<String, dynamic> data) =>
      UserMeditationsStruct(
        mediationName: data['MediationName'] as String?,
        meditationImage: data['MeditationImage'] as String?,
        meditationDuration: data['MeditationDuration'] as String?,
        mediationCategory: data['MediationCategory'] as String?,
        meditationAudioUrl: data['MeditationAudioUrl'] as String?,
        meditationLikes: castToType<double>(data['MeditationLikes']),
        meditationDetail: data['MeditationDetail'] as String?,
        meditationVoice: data['MeditationVoice'] as String?,
        isFavourite: data['isFavourite'] as bool?,
        isLiked: data['isLiked'] as bool?,
      );

  static UserMeditationsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserMeditationsStruct.fromMap(data.cast<String, dynamic>())
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
        'isFavourite': _isFavourite,
        'isLiked': _isLiked,
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
        'isFavourite': serializeParam(
          _isFavourite,
          ParamType.bool,
        ),
        'isLiked': serializeParam(
          _isLiked,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserMeditationsStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserMeditationsStruct(
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
        isFavourite: deserializeParam(
          data['isFavourite'],
          ParamType.bool,
          false,
        ),
        isLiked: deserializeParam(
          data['isLiked'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserMeditationsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserMeditationsStruct &&
        mediationName == other.mediationName &&
        meditationImage == other.meditationImage &&
        meditationDuration == other.meditationDuration &&
        mediationCategory == other.mediationCategory &&
        meditationAudioUrl == other.meditationAudioUrl &&
        meditationLikes == other.meditationLikes &&
        meditationDetail == other.meditationDetail &&
        meditationVoice == other.meditationVoice &&
        isFavourite == other.isFavourite &&
        isLiked == other.isLiked;
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
        isFavourite,
        isLiked
      ]);
}

UserMeditationsStruct createUserMeditationsStruct({
  String? mediationName,
  String? meditationImage,
  String? meditationDuration,
  String? mediationCategory,
  String? meditationAudioUrl,
  double? meditationLikes,
  String? meditationDetail,
  String? meditationVoice,
  bool? isFavourite,
  bool? isLiked,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserMeditationsStruct(
      mediationName: mediationName,
      meditationImage: meditationImage,
      meditationDuration: meditationDuration,
      mediationCategory: mediationCategory,
      meditationAudioUrl: meditationAudioUrl,
      meditationLikes: meditationLikes,
      meditationDetail: meditationDetail,
      meditationVoice: meditationVoice,
      isFavourite: isFavourite,
      isLiked: isLiked,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserMeditationsStruct? updateUserMeditationsStruct(
  UserMeditationsStruct? userMeditations, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userMeditations
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserMeditationsStructData(
  Map<String, dynamic> firestoreData,
  UserMeditationsStruct? userMeditations,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userMeditations == null) {
    return;
  }
  if (userMeditations.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userMeditations.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userMeditationsData =
      getUserMeditationsFirestoreData(userMeditations, forFieldValue);
  final nestedData =
      userMeditationsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userMeditations.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserMeditationsFirestoreData(
  UserMeditationsStruct? userMeditations, [
  bool forFieldValue = false,
]) {
  if (userMeditations == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userMeditations.toMap());

  // Add any Firestore field values
  userMeditations.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserMeditationsListFirestoreData(
  List<UserMeditationsStruct>? userMeditationss,
) =>
    userMeditationss
        ?.map((e) => getUserMeditationsFirestoreData(e, true))
        .toList() ??
    [];
