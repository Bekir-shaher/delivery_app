import 'package:delivery_app/core/network/networkInfo.dart';
import 'package:delivery_app/core/router/routeGenerator.dart';
import 'package:delivery_app/futuers/user/data/dataSource/LoginRemoteDataSource.dart';
import 'package:delivery_app/futuers/user/data/dataSource/localDataBase/users.dart';
import 'package:delivery_app/futuers/user/data/repository/loginDataRepository/loginDataRepo.dart';
import 'package:delivery_app/futuers/user/domain/useCase/LoginUseCase.dart';
import 'package:delivery_app/futuers/user/presention/cubit/deleivery_cubit.dart';
import 'package:delivery_app/futuers/user/presention/screens/loginScreen.dart';
import 'package:delivery_app/futuers/user/presention/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

void main() {
  // بناء الاعتماديات
  final remote = LoginRemoteDataSource(http.Client());
  final network = NetworkInfoImpl(InternetConnectionChecker.instance);
  final db = AppDatabase();
  final repo = LoginDataRepo(remote: remote, network: network, db: db);
  final useCase = LoginUseCase(repo);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: repo),
        RepositoryProvider.value(value: useCase),
      ],
      child: BlocProvider(
        create: (_) => DeliveryCubit(useCase),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashScreen',
      onGenerateRoute: Routegenerator.generateRouter,
      // routes: {
      //   '/splashScreen': (context) => const SplashScreen(),
      //   '/': (context) => const Loginscreen(),
      // },
    );
  }
}
