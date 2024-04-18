class NotificationMessage {
  final String? id;
  final String? title;
  final String? body;

  NotificationMessage({this.id, this.title, this.body});

  factory NotificationMessage.fromJson(Map<String, dynamic> json) {
    final notification = json['notification'];
    return NotificationMessage(
      id: json['id'],
      title: notification['title'],
      body: notification['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}