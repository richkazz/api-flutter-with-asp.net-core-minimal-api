enum PageChange {
  courseRegisteration,
  result,
  news,
  fees,
  changePassword,
  settings,
  account;

  /// Convert to string data type
  String get toPageChangeString {
    switch (this) {
      case PageChange.account:
        return 'ACCOUNTs';
      case PageChange.settings:
        return 'SETTING';
      case PageChange.courseRegisteration:
        return 'COURSES  REG';
      case PageChange.changePassword:
        return 'CHANGE PASSWORD';
      case PageChange.result:
        return 'RESULT';
      case PageChange.news:
        return 'NEWS';
      case PageChange.fees:
        return 'FEES';
    }
  }
}
