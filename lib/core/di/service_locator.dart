import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:oxyn_dev/core/notifications/cloud_messaging_api.dart';
import 'package:oxyn_dev/core/notifications/local_notification_api.dart';
import '../../config/environment.dart';
import '../network/dio_client.dart';
import '../security/secured_auth_storage.dart';
import '../storage_service/storage_service.dart';

final sl = GetIt.instance;

void setupLocator(Environment environment) async {
  // sl.registerLazySingleton<AuthRepo>(
  //   () => AuthRepo(dioClient: sl<DioClient>()),
  // );

  // sl.registerLazySingleton<DashboardRepo>(
  //   () => DashboardRepo(dioClient: sl<DioClient>()),
  // );

  /// ==================== Environment =========================
  sl.registerLazySingleton<Environment>(() => environment);

  /// ==================== Shared Pref =========================
  sl.registerSingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance());

  /// ==================== DataBase ===========================
  sl.registerLazySingleton<AuthSecuredStorage>(() => AuthSecuredStorage());
  sl.registerSingletonWithDependencies<StorageService>(
    () => StorageService(sharedPreferences: sl()),
    dependsOn: [SharedPreferences],
  );

  /// ==================== Networking ===========================
  sl.registerLazySingleton<DioClient>(() => DioClient(environment: sl()));

  /// ==================== Modules ===========================

  // sl.registerLazySingleton<SessionRepository>(
  //   () => SessionRepository(
  //     storageService: sl<StorageService>(),
  //     authSecuredStorage: sl<AuthSecuredStorage>(),
  //   ),
  // );

  // notifications
  // sl.registerLazySingleton<CloudMessagingApi>(() => CloudMessagingApi());
  // sl.registerLazySingleton<LocalNotificationsApi>(
  //     () => LocalNotificationsApi());
}
