// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/authetication/domain/i_authetication_facade.dart'
    as _i466;
import '../../../features/authetication/infrastructor/i_authetication_impl.dart'
    as _i140;
import '../../services/local_storage_services.dart' as _i447;
import 'firebase_injectable_module.dart' as _i574;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  await gh.factoryAsync<_i574.FirebaseServeice>(
    () => firebaseInjectableModule.firebaseServeice,
    preResolve: true,
  );
  gh.lazySingleton<_i447.LocalStorageServices>(
      () => _i447.LocalStorageServices());
  gh.lazySingleton<_i974.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i59.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i466.IAutheticationFacade>(
      () => _i140.IAutheticationImpl(gh<_i59.FirebaseAuth>()));
  return getIt;
}

class _$FirebaseInjectableModule extends _i574.FirebaseInjectableModule {}
