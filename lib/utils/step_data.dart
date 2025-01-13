class NotificationPreferences {
  bool sms;
  bool email;
  bool pushNotifications;

  NotificationPreferences({
    this.sms = false,
    this.email = false,
    this.pushNotifications = false,
  });

  void updatePreferences({bool? sms, bool? email, bool? pushNotifications}) {
    if (sms != null) this.sms = sms;
    if (email != null) this.email = email;
    if (pushNotifications != null) this.pushNotifications = pushNotifications;
  }

  @override
  String toString() {
    return 'SMS: $sms, Email: $email, Push Notifications: $pushNotifications';
  }
}