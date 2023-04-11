import 'models.dart';

class AdminSetting {
  List<SeniorSchoolSubject> seniorSchoolSubjects;
  List<JuniorSchoolSubject> juniorSchoolSubjects;
  List<ClassInSchool> classInSchools;
  CurrentGradingSystem? currentGradingSystems;

  AdminSetting(
      {required this.seniorSchoolSubjects,
      required this.juniorSchoolSubjects,
      required this.currentGradingSystems,
      required this.classInSchools});

  factory AdminSetting.fromJson(Map<String, dynamic> json) {
    return AdminSetting(
      seniorSchoolSubjects: List<SeniorSchoolSubject>.from(
          json['seniorSchoolSubjects']
              .map((x) => SeniorSchoolSubject.fromJson(x))),
      juniorSchoolSubjects: List<JuniorSchoolSubject>.from(
          json['juniorSchoolSubjects']
              .map((x) => JuniorSchoolSubject.fromJson(x))),
      classInSchools: List<ClassInSchool>.from(
          json['classInSchools'].map((x) => ClassInSchool.fromJson(x))),
      currentGradingSystems: json['currentGradingSystems'] == null
          ? CurrentGradingSystem(gradingSystem: 1)
          : CurrentGradingSystem.fromJson(json['currentGradingSystems']),
    );
  }

  Map<String, dynamic> toJson() => {
        'currentGradingSystems': currentGradingSystems!.toJson(),
        'juniorSchoolSubjects':
            List<dynamic>.from(juniorSchoolSubjects.map((x) => x.toJson())),
        'seniorSchoolSubjects':
            List<dynamic>.from(seniorSchoolSubjects.map((x) => x.toJson())),
        'classInSchools':
            List<dynamic>.from(classInSchools.map((x) => x.toJson())),
      };
}
