import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationModel {
  static final _notification = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String>();

  void initialize() async {
    InitializationSettings settings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'));
    _notification.initialize(settings, onSelectNotification: (payLoad) async {
      onNotifications.add(payLoad);
    });
  }

  static Future notificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails(
      'channel id',
      'channel name',
      importance: Importance.max,
    ));
  }

  static Future showNotification({id = 0, title, body, payLoad}) async {
    _notification.show(id, title, body, await notificationDetails(),
        payload: payLoad);
  }

  static Future periodicNotification(
      {id = 0, title, body, payLoad,}) async {
    final interval=RepeatInterval.hourly;
    _notification.periodicallyShow(
      id,
      title,
      body,
      interval,
      await notificationDetails(),
    );
  }

  static Future scheduledNotification(
      {id = 0, title, body, payLoad, scheduledDate}) async {
    tz.initializeTimeZones();
    _notification.zonedSchedule(
        id,
        title,
        body,
        //tz.TZDateTime.from(scheduledDate,tz.local),
        _scheduleDaily(Time(10)),
        await notificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  static tz.TZDateTime _scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(Duration(days: 1))
        : scheduleDate;
  }


  static Future cancelAllNotifications()async{
    _notification.cancelAll();
  }
}
