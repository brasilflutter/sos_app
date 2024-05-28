import 'package:flutter_modular/flutter_modular.dart';

import '../../../main.dart';
import '../../utilities/gateway/dio_gateway.dart';
import '../../utilities/gateway/igateway.dart';
import '../data/datasources/user_local.dart';
import '../externals/datasources/local/local_storage.dart';
import '../externals/datasources/local/user_local_impl.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addSingleton<LocalStorageDatasource>(() => LocalStorageDatasource());
    i.add<IGateway>((i) => DioGateway(baseUrl: env.baseUrl));
    i.add<IUserLocalDatasource>(UserLocalDatasourceImpl.new);
  }
}
