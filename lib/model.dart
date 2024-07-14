class Schedule {
  Map<String, dynamic> attr;
  Schedule({required this.attr});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(attr: json);
  }
}
