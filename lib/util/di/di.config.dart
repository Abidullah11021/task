// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../../features/auth/data/repository/auth_repository_imp.dart' as _i794;
import '../../features/auth/data/source/remote/auth_remote_datasource_imp.dart'
    as _i716;
import '../../features/auth/domain/data/auth_remote_datasource.dart' as _i998;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/usecases/google_login.dart' as _i434;
import '../../features/auth/domain/usecases/login.dart' as _i428;
import '../../features/auth/domain/usecases/register.dart' as _i480;
import '../../helpers/network_call_helper/firebase_call_helper_impl.dart'
    as _i352;
import '../../helpers/network_call_helper/network_call_helper.dart' as _i73;
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i974.Logger>(() => _i913.LoggerImp());
    gh.lazySingleton<_i73.NetworkCallHelper>(
        () => _i352.FirebaseHelperImpl(logger: gh<_i974.Logger>()));
    gh.lazySingleton<_i998.AuthRemoteDataSource>(
        () => _i716.AuthRemoteDataSourceImp(
              logger: gh<_i974.Logger>(),
              networkCallHelper: gh<_i73.NetworkCallHelper>(),
            ));
    gh.lazySingleton<_i961.AuthRepository>(() => _i794.AuthRepositoryImp(
        authRemoteDataSource: gh<_i998.AuthRemoteDataSource>()));
    gh.lazySingleton<_i428.LoginUsecase>(
        () => _i428.LoginUsecase(authRepository: gh<_i961.AuthRepository>()));
    gh.lazySingleton<_i480.RegisterUsecase>(() =>
        _i480.RegisterUsecase(authRepository: gh<_i961.AuthRepository>()));
    gh.lazySingleton<_i434.GoogleLoginUsecase>(() =>
        _i434.GoogleLoginUsecase(authRepository: gh<_i961.AuthRepository>()));
    return this;
  }
}
