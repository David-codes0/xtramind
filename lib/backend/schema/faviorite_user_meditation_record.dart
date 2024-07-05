import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavioriteUserMeditationRecord extends FirestoreRecord {
  FavioriteUserMeditationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "mediation" field.
  MeditationStruct? _mediation;
  MeditationStruct get mediation => _mediation ?? MeditationStruct();
  bool hasMediation() => _mediation != null;

  // "meditation" field.
  DocumentReference? _meditation;
  DocumentReference? get meditation => _meditation;
  bool hasMeditation() => _meditation != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _mediation = MeditationStruct.maybeFromMap(snapshotData['mediation']);
    _meditation = snapshotData['meditation'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FavioriteUserMeditation');

  static Stream<FavioriteUserMeditationRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => FavioriteUserMeditationRecord.fromSnapshot(s));

  static Future<FavioriteUserMeditationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FavioriteUserMeditationRecord.fromSnapshot(s));

  static FavioriteUserMeditationRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      FavioriteUserMeditationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavioriteUserMeditationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavioriteUserMeditationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavioriteUserMeditationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavioriteUserMeditationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavioriteUserMeditationRecordData({
  String? userId,
  MeditationStruct? mediation,
  DocumentReference? meditation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'mediation': MeditationStruct().toMap(),
      'meditation': meditation,
    }.withoutNulls,
  );

  // Handle nested data for "mediation" field.
  addMeditationStructData(firestoreData, mediation, 'mediation');

  return firestoreData;
}

class FavioriteUserMeditationRecordDocumentEquality
    implements Equality<FavioriteUserMeditationRecord> {
  const FavioriteUserMeditationRecordDocumentEquality();

  @override
  bool equals(
      FavioriteUserMeditationRecord? e1, FavioriteUserMeditationRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.mediation == e2?.mediation &&
        e1?.meditation == e2?.meditation;
  }

  @override
  int hash(FavioriteUserMeditationRecord? e) =>
      const ListEquality().hash([e?.userId, e?.mediation, e?.meditation]);

  @override
  bool isValidKey(Object? o) => o is FavioriteUserMeditationRecord;
}
