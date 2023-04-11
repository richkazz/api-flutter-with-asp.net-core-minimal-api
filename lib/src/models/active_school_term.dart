class ActiveSchoolTerm {
  int? id;
  int? activeTerm;

  ActiveSchoolTerm({this.id, this.activeTerm});

  factory ActiveSchoolTerm.fromJson(Map<String, dynamic> json) {
    return ActiveSchoolTerm(
      id: json['id'] as int,
      activeTerm: json['activeTerm'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['activeTerm'] = activeTerm;
    return data;
  }
}
