class NotificationEntity {
  final String title;
  final String body;
  final String fcmToken; 
  
  NotificationEntity({
    required this.title,
    required this.body,
    required this.fcmToken,
  });
}
