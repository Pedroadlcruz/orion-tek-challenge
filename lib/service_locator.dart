import 'package:get_it/get_it.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/tables/addresses.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/tables/clients.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/tables/companies.dart';
import 'package:orion_tek_challenge/data/repository/fake_company_repository.dart';
import 'package:orion_tek_challenge/domain/company_repository.dart';
import 'package:orion_tek_challenge/presentation/blocs/add_client/add_client_bloc.dart';
import 'package:orion_tek_challenge/presentation/blocs/add_company_bloc/add_company_bloc.dart';
import 'package:orion_tek_challenge/presentation/blocs/company_detail/company_detail_bloc.dart';
import 'package:orion_tek_challenge/presentation/blocs/home_bloc/home_bloc.dart';

import 'presentation/blocs/add_address/add_address_bloc.dart';
import 'presentation/blocs/client_detail/client_detail_bloc.dart';

///
/// Service Locator
///
GetIt sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  //! Blocs
  sl.registerFactory(() => HomeBloc(companiesRepository: sl()));
  sl.registerFactory(() => AddCompanyBloc(companiesRepository: sl()));
  sl.registerFactory(() => CompanyDetailBloc(companiesRepository: sl()));
  sl.registerFactory(() => AddClientBloc(companiesRepository: sl()));
  sl.registerFactory(() => ClientDetailBloc(companiesRepository: sl()));
  sl.registerFactory(() => AddAddressBloc(companiesRepository: sl()));

  //! Repositories

  sl.registerLazySingleton<CompanyRepository>(
    () => FakeCompaniesRepository(
      companiesDao: sl(),
      clientsDao: sl(),
      addressesDao: sl(),
    ),
  );

  //! Database
  final db = AppDatabase();
  sl.registerSingleton<AppDatabase>(
    db,
    dispose: (_) => db.close(),
  );
  //! Tables
  sl.registerLazySingleton<CompaniesDao>(() => CompaniesDao(db));
  sl.registerLazySingleton<ClientsDao>(() => ClientsDao(db));
  sl.registerLazySingleton<AddressesDao>(() => AddressesDao(db));
}
