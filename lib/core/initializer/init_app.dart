import 'package:bkmc/core/notifications/cloud_messaging_api.dart';
import 'package:bkmc/core/notifications/local_notification_api.dart';

import '../../config/environment.dart';
import '../di/service_locator.dart';

Future<void> initApp(Environment env) async {
  setupLocator(env);
  await sl.allReady();
  // await sl<CloudMessagingApi>().initialize();
  // await sl<LocalNotificationsApi>().initialize();
}
