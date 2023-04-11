
class Subject {
  final int id;
  final String subject;

  Subject({required this.id, required this.subject});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      subject: json['subjects'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subjects': subject,
    };
  }
}
