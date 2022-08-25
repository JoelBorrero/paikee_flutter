class ScheduledClass {
  final int id;
  final int color;
  final String hour;
  final String index;
  final String status;
  final String teacher;
  final String avatar;

  const ScheduledClass({
    required this.id,
    required this.status,
    required this.hour,
    required this.teacher,
    required this.index,
    required this.color,
    required this.avatar,
  });

  factory ScheduledClass.fromJson(Map<String, dynamic> json) {
    return ScheduledClass(
      id: json['id'],
      status: json['status'],
      hour: json['hour'],
      teacher: json['teacher']['name'],
      index: json['index'],
      color: json['color'],
      avatar: json['teacher']['avatar'],
    );
  }
}
