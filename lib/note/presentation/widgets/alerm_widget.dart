import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/src/date_time.dart';

class ReminderPage extends StatefulWidget {
  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  int _selectedTime = 10;

  @override
  void initState() {
    super.initState();

    // Initialize notifications
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
    );
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _scheduleReminder(int minutes) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'reminder_channel_id',
      'Reminder Channel',

      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    final platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    // Calculate time for reminder
    final scheduledTime = DateTime.now().add(Duration(minutes: minutes));

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Reminder',
      'This is your reminder!',
      NotificationDetails(
        android:AndroidNotificationDetails(
          '',
          '',
          channelDescription: '',
          importance: Importance.max,
        ) ,

      ) as TZDateTime ,
      // scheduledTime,
      platformChannelSpecifics, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Reminder Time:',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
        DropdownButton<int>(
          value: _selectedTime,
          items: [10, 15, 30, 60].map((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text('$value minutes'),
            );
          }).toList(),
          onChanged: (int? newValue) {
            setState(() {
              _selectedTime = newValue!;
            });
          },
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _scheduleReminder(_selectedTime);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Reminder set for $_selectedTime minutes from now!'),
              ),
            );
          },
          child: Text('Set Reminder'),
        ),
      ],
    );
  }
}