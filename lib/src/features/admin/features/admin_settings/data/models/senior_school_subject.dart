import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/data/models/subject.dart';

class SeniorSchoolSubject {
  int? id;
  int subjectId;
  Subject? schoolSubjects;

  SeniorSchoolSubject({
    this.id,
    required this.subjectId,
    this.schoolSubjects,
  });

  factory SeniorSchoolSubject.fromJson(Map<String, dynamic> json) {
    return SeniorSchoolSubject(
      id: json['id'],
      subjectId: json['subjectId'],
      schoolSubjects: Subject.fromJson(json['schoolSubjects']),
    );
  }
  Map<String, dynamic> toJson() => {'subjectId': subjectId};
}
