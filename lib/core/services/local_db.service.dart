import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';

class LocalDbService {
  LocalDbService._();

  static late final Isar _db;

  /// Initialize the local database.
  static Future<void> initialize() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      _db = await Isar.open(
        [LocalUserDataSchema],
        directory: dir.path,
      );
    } catch (e) {
      log('Error initializing database: $e');
      rethrow;
    }
  }

  /// Get the database instance.
  static Isar get instance => _db;

  /// Close the database.
  Future<void> close() async {
    try {
      await _db.close();
    } catch (e) {
      log('Error closing database: $e');
    }
  }

  /// Clear all local user data.
  static Future<void> clearLocalData() async {
    await _safeWriteTxn(() async {
      await _db.localUserDatas.filter().tokenIsNotEmpty().deleteAll();
    }, 'clearLocalData');
  }

  /// Insert or update a user local data record.
  static Future<void> insertUserLocalData(LocalUserData userLocalData) async {
    await _safeWriteTxn(() async {
      await _db.localUserDatas.put(userLocalData);
    }, 'insertUserLocalData');
  }

  /// Get user local data asynchronously.
  static Future<LocalUserData?> getUserLocalData() async {
    return await _safeRead(
        () async => _db.localUserDatas.get(1), 'getUserLocalData');
  }

  /// Get the user token synchronously.
  static String getUserToken() {
    return _safeSync(
        () => _db.localUserDatas.getSync(1)?.token ?? '', 'getUserToken');
  }

  /// Get user local data synchronously.
  static LocalUserData? getUserLocalDataSync() {
    return _safeSync(
        () => _db.localUserDatas.getSync(1), 'getUserLocalDataSync');
  }

  /// Set user local data.
  static Future<void> setUserLocalData(LocalUserData user) async {
    await _safeWriteTxn(() async {
      await _db.localUserDatas.put(user);
    }, 'setUserLocalData');
  }

  /// Helper method to safely perform write transactions.
  static Future<void> _safeWriteTxn(
      Future<void> Function() action, String operation) async {
    try {
      await _db.writeTxn(action);
    } catch (e) {
      log('Error in $operation: $e');
    }
  }

  /// Helper method to safely perform read operations.
  static Future<T?> _safeRead<T>(
      Future<T?> Function() action, String operation) async {
    try {
      return await action();
    } catch (e) {
      log('Error in $operation: $e');
      return null;
    }
  }

  /// Helper method to safely perform synchronous operations.
  static T _safeSync<T>(T Function() action, String operation) {
    try {
      return action();
    } catch (e) {
      log('Error in $operation: $e');
      return T is String ? '' as T : null as T;
    }
  }
}
