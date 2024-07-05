import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MediationsRecord extends FirestoreRecord {
  MediationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "MediationName" field.
  String? _mediationName;
  String get mediationName => _mediationName ?? '';
  bool hasMediationName() => _mediationName != null;

  // "MediationDetail" field.
  String? _mediationDetail;
  String get mediationDetail => _mediationDetail ?? '';
  bool hasMediationDetail() => _mediationDetail != null;

  // "MeditationDuration" field.
  String? _meditationDuration;
  String get meditationDuration => _meditationDuration ?? '';
  bool hasMeditationDuration() => _meditationDuration != null;

  // "MeditationLikes" field.
  int? _meditationLikes;
  int get meditationLikes => _meditationLikes ?? 0;
  bool hasMeditationLikes() => _meditationLikes != null;

  // "MeditationAudioUrl" field.
  String? _meditationAudioUrl;
  String get meditationAudioUrl => _meditationAudioUrl ?? '';
  bool hasMeditationAudioUrl() => _meditationAudioUrl != null;

  // "MediationCategory" field.
  String? _mediationCategory;
  String get mediationCategory => _mediationCategory ?? '';
  bool hasMediationCategory() => _mediationCategory != null;

  // "MeditationVoice" field.
  String? _meditationVoice;
  String get meditationVoice => _meditationVoice ?? '';
  bool hasMeditationVoice() => _meditationVoice != null;

  // "MeditationImage" field.
  String? _meditationImage;
  String get meditationImage => _meditationImage ?? '';
  bool hasMeditationImage() => _meditationImage != null;

  // "isLocked" field.
  bool? _isLocked;
  bool get isLocked => _isLocked ?? false;
  bool hasIsLocked() => _isLocked != null;

  void _initializeFields() {
    _mediationName = snapshotData['MediationName'] as String?;
    _mediationDetail = snapshotData['MediationDetail'] as String?;
    _meditationDuration = snapshotData['MeditationDuration'] as String?;
    _meditationLikes = castToType<int>(snapshotData['MeditationLikes']);
    _meditationAudioUrl = snapshotData['MeditationAudioUrl'] as String?;
    _mediationCategory = snapshotData['MediationCategory'] as String?;
    _meditationVoice = snapshotData['MeditationVoice'] as String?;
    _meditationImage = snapshotData['MeditationImage'] as String?;
    _isLocked = snapshotData['isLocked'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Mediations');

  static Stream<MediationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MediationsRecord.fromSnapshot(s));

  static Future<MediationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MediationsRecord.fromSnapshot(s));

  static MediationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MediationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MediationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MediationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MediationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MediationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMediationsRecordData({
  String? mediationName,
  String? mediationDetail,
  String? meditationDuration,
  int? meditationLikes,
  String? meditationAudioUrl,
  String? mediationCategory,
  String? meditationVoice,
  String? meditationImage,
  bool? isLocked,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'MediationName': mediationName,
      'MediationDetail': mediationDetail,
      'MeditationDuration': meditationDuration,
      'MeditationLikes': meditationLikes,
      'MeditationAudioUrl': meditationAudioUrl,
      'MediationCategory': mediationCategory,
      'MeditationVoice': meditationVoice,
      'MeditationImage': meditationImage,
      'isLocked': isLocked,
    }.withoutNulls,
  );

  return firestoreData;
}

class MediationsRecordDocumentEquality implements Equality<MediationsRecord> {
  const MediationsRecordDocumentEquality();

  @override
  bool equals(MediationsRecord? e1, MediationsRecord? e2) {
    return e1?.mediationName == e2?.mediationName &&
        e1?.mediationDetail == e2?.mediationDetail &&
        e1?.meditationDuration == e2?.meditationDuration &&
        e1?.meditationLikes == e2?.meditationLikes &&
        e1?.meditationAudioUrl == e2?.meditationAudioUrl &&
        e1?.mediationCategory == e2?.mediationCategory &&
        e1?.meditationVoice == e2?.meditationVoice &&
        e1?.meditationImage == e2?.meditationImage &&
        e1?.isLocked == e2?.isLocked;
  }

  @override
  int hash(MediationsRecord? e) => const ListEquality().hash([
        e?.mediationName,
        e?.mediationDetail,
        e?.meditationDuration,
        e?.meditationLikes,
        e?.meditationAudioUrl,
        e?.mediationCategory,
        e?.meditationVoice,
        e?.meditationImage,
        e?.isLocked
      ]);

  @override
  bool isValidKey(Object? o) => o is MediationsRecord;
}
