enum StaffAndStudent {
  staff,
  student;

  String get asString {
    switch (this) {
      case StaffAndStudent.staff:
        return "STAFF";
      case StaffAndStudent.student:
        return "STUDENT";
    }
  }
}
