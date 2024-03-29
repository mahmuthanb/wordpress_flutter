import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDataSource {
  String? get domain;
  Future setDomain(String? domain);

  bool? get darkTheme;
  Future setDarkTheme(bool status);

  Future clearStorage();
}

@Environment(Environment.prod)
@Environment(Environment.dev)
@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final GetStorage _getStorage;
  LocalDataSourceImpl(this._getStorage);
  @override
  String? get domain => _getStorage.read("domain");

  @override
  Future setDomain(String? domain) {
    return _getStorage.write("domain", domain);
  }

  @override
  bool? get darkTheme => _getStorage.read("darkTheme");

  @override
  Future setDarkTheme(bool status) {
    return _getStorage.write("darkTheme", status);
  }

  @override
  Future clearStorage() {
    return _getStorage.erase();
  }
}
