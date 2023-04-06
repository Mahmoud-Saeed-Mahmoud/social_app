import 'package:get_storage/get_storage.dart';

import 'local_storage_repository.dart';

class LocalStorageImplementaion extends LocalStorageRepository {
  final _localStorage = GetStorage();

  @override
  void write(String key, dynamic value) {
    _localStorage.write(key, value);
    _localStorage.save();
  }

  @override
  dynamic read(String key) {
    _localStorage.read(key);
  }

  @override
  void remove(String key) {
    _localStorage.remove(key);
  }

  @override
  void erase() {
    _localStorage.erase();
  }
}
