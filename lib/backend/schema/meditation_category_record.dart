import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeditationCategoryRecord extends FirestoreRecord {
  MeditationCategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CategoryName" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  // "CategoryImage" field.
  String? _categoryImage;
  String get categoryImage => _categoryImage ?? '';
  bool hasCategoryImage() => _categoryImage != null;

  void _initializeFields() {
    _categoryName = snapshotData['CategoryName'] as String?;
    _categoryImage = snapshotData['CategoryImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MeditationCategory');

  static Stream<MeditationCategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeditationCategoryRecord.fromSnapshot(s));

  static Future<MeditationCategoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MeditationCategoryRecord.fromSnapshot(s));

  static MeditationCategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeditationCategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeditationCategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeditationCategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeditationCategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeditationCategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeditationCategoryRecordData({
  String? categoryName,
  String? categoryImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CategoryName': categoryName,
      'CategoryImage': categoryImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeditationCategoryRecordDocumentEquality
    implements Equality<MeditationCategoryRecord> {
  const MeditationCategoryRecordDocumentEquality();

  @override
  bool equals(MeditationCategoryRecord? e1, MeditationCategoryRecord? e2) {
    return e1?.categoryName == e2?.categoryName &&
        e1?.categoryImage == e2?.categoryImage;
  }

  @override
  int hash(MeditationCategoryRecord? e) =>
      const ListEquality().hash([e?.categoryName, e?.categoryImage]);

  @override
  bool isValidKey(Object? o) => o is MeditationCategoryRecord;
}
