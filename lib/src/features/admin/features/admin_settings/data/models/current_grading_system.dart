class CurrentGradingSystem {
  int? id;
  int gradingSystem;

  CurrentGradingSystem({
    this.id,
    required this.gradingSystem,
  });

  factory CurrentGradingSystem.fromJson(Map<String, dynamic> json) {
    return CurrentGradingSystem(
      id: json['id'],
      gradingSystem: json['gradingSystem'],
    );
  }

  Map<String, dynamic> toJson() => {
        'gradingSystem': gradingSystem,
      };
}
