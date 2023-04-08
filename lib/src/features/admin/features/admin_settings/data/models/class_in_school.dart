class ClassInSchool {
  final int? id;
  final String className;

  ClassInSchool({this.id, required this.className});

  factory ClassInSchool.fromJson(Map<String, dynamic> json) {
    return ClassInSchool(
      id: json['id'],
      className: (json['className'] as String).trim(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'className': className.trim(),
    };
  }
}
