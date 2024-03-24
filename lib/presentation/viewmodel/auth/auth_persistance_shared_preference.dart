import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_persistance.dart';

part 'auth_persistance_shared_preference.g.dart';

@riverpod
Future<SharedPreferencePersistance> sharedPreferencePersistance(
    SharedPreferencePersistanceRef ref) async {
  final instance = await SharedPreferences.getInstance();

  return SharedPreferencePersistance(instance);
}

class SharedPreferencePersistance extends AuthPersistance {
  final SharedPreferences storage;

  SharedPreferencePersistance(this.storage);

  @override
  String? get(String key) {
    final result = storage.getString(key);

    print('persistance_get: key: $key, token: $result');

    return result;
  }

  @override
  Future remove(String key) async {
    final result = await storage.remove(key);

    print('persistance_remove: key: $key, result: $result');

    return result;
  }

  @override
  Future set(String key, String value) async {
    final result = await storage.setString(key, value);

    print('persistance_set: key: $key, result: $result');

    return result;
  }
}
