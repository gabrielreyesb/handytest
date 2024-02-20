class Visit {
  final int id;
  final String recurrence;
  final DateTime eventStart;
  final DateTime eventEnd;
  final String comment;
  final String salesForecast;
  final int user;
  final String customer;

  const Visit({
    required this.id,
    required this.recurrence,
    required this.eventStart,
    required this.eventEnd,
    required this.comment,
    required this.salesForecast,
    required this.user,
    required this.customer,
  });

  factory Visit.fromJson(Map<String, dynamic> json) {
    return Visit(
      id: json['id'],
      recurrence: json['recurrence'],
      eventStart: json['eventStart'],
      eventEnd: json['eventEnd'],
      comment: json['comment'],
      salesForecast: json['salesForecast'],
      user: json['user'],
      customer: json['cutomer'],
    );
  }
}
