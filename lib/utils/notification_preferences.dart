import 'package:flutter/material.dart';

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

  Widget notificationPreferences() {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text('SMS'),
          value: true,
          onChanged: (value) {},
        ),
        CheckboxListTile(
          title: const Text('Email'),
          value: false,
          onChanged: (value) {},
        ),
        CheckboxListTile(
          title: const Text('Push Notifications'),
          value: true,
          onChanged: (value) {},
        ),
      ],
    );
  }

  @override
  String toString() {
    return 'SMS: $sms, Email: $email, Push Notifications: $pushNotifications';
  }
}