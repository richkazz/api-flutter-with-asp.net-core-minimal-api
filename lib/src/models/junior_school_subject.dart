import 'package:api_tempate_flutter/src/models/subject.dart';

class JuniorSchoolSubject {
  int? id;
  int subjectId;
  Subject? schoolSubjects;

  JuniorSchoolSubject({
    this.id,
    required this.subjectId,
    this.schoolSubjects,
  });

  factory JuniorSchoolSubject.fromJson(Map<String, dynamic> json) {
    return JuniorSchoolSubject(
      id: json['id'],
      subjectId: json['subjectId'],
      schoolSubjects: Subject.fromJson(json['schoolSubjects']),
    );
  }

  Map<String, dynamic> toJson() => {'subjectId': subjectId};
}
