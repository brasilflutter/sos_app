import '../../../../utilities/extensions/result.dart';
import '../../../data/datasources/user_local.dart';
import 'local_storage.dart';

class UserLocalDatasourceImpl implements IUserLocalDatasource {
  UserLocalDatasourceImpl({required this.datasource});

  final LocalStorageDatasource datasource;

  @override
  Future<bool> saveCredentials({required Map<String, dynamic> map}) async {
    final response = await datasource.set(
      key: this.runtimeType.toString(),
      value: map,
    );
    return response.isSuccess;
  }

  @override
  Future<Map<String, dynamic>> getCredentials() async {
    final response = await datasource.get(
      key: this.runtimeType.toString(),
    );
    if (response.isFailure) {
      throw response.getFailure;
    }
    return response.getSuccess;
  }

  @override
  Future<bool> deleteCredentials() async {
    final response = await datasource.delete(
      key: this.runtimeType.toString(),
    );
    return response.isSuccess;
  }
}
