abstract interface class IUserLocalDatasource {
  Future<bool> saveCredentials({required Map<String, dynamic> map});
  Future<Map<String, dynamic>> getCredentials();
  Future<bool> deleteCredentials();
}
