import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utilities/exceptions/application_exception.dart';
import '../../../../utilities/extensions/result.dart';

class LocalStorageDatasource {
  LocalStorageDatasource();

  Future<Result<ApplicationException, bool>> clear() async {
    try {
      final local = await _storage;

      await local.clear();
      return (null, true);
    } catch (exception, stackTrace) {
      return (ApplicationException(message: exception.toString(), stackTrace: stackTrace), null);
    }
  }

  Future<Result<ApplicationException, bool>> delete({required String key}) async {
    try {
      final local = await _storage;

      final response = await local.remove(key);
      return (null, response);
    } catch (exception, stackTrace) {
      return (ApplicationException(message: exception.toString(), stackTrace: stackTrace), null);
    }
  }

  Future<Result<ApplicationException, Map<String, dynamic>>> get({required String key}) async {
    try {
      final local = await _storage;

      final response = local.getString(key);
      if (response == null) return (null, {}.cast<String, dynamic>());
      final Map<String, dynamic> data = jsonDecode(response);
      return (null, data);
    } catch (exception, stackTrace) {
      return (ApplicationException(message: exception.toString(), stackTrace: stackTrace), null);
    }
  }

  Future<Result<ApplicationException, bool>> set({required String key, required Map<String, dynamic> value}) async {
    try {
      final jsonString = jsonEncode(value);
      final local = await _storage;

      final response = await local.setString(key, jsonString);
      return (null, response);
    } catch (exception, stackTrace) {
      return (ApplicationException(message: exception.toString(), stackTrace: stackTrace), null);
    }
  }

  Future<Result<ApplicationException, List<Map<String, dynamic>>>> getMany({required String key}) async {
    try {
      final local = await _storage;

      final response = local.getStringList(key);
      if (response == null || response.isEmpty) return (null, [].cast<Map<String, dynamic>>());
      final data = response.map<Map<String, dynamic>>((e) => jsonDecode(e)).toList();
      return (null, data);
    } catch (exception, stackTrace) {
      return (ApplicationException(message: exception.toString(), stackTrace: stackTrace), null);
    }
  }

  Future<Result<ApplicationException, bool>> setMany({required String key, required List<Map<String, dynamic>> value}) async {
    try {
      final jsonString = value.map((e) => jsonEncode(e)).toList();
      final local = await _storage;

      final response = await local.setStringList(key, jsonString);
      return (null, response);
    } catch (exception, stackTrace) {
      return (ApplicationException(message: exception.toString(), stackTrace: stackTrace), null);
    }
  }

  Future<SharedPreferences> get _storage async {
    return SharedPreferences.getInstance();
  }
}
