import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/test_api_app.dart';
import 'core/cache/cache_helper.dart';
import 'core/api/dio_consumer.dart';
import 'modules/auth/Data/repo_implemnt/auth_repo_implement.dart';
import 'modules/auth/presentation/cubit/auth_cubit.dart';
import 'modules/profile/Data/repo_implemnt/user_repo_implementation.dart';
import 'modules/profile/Presentation/cubit/user_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            AuthRepoImplement(
              api: DioConsumer(dio: Dio()),
            ),
          ),
        ),
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(
            UserRepoImplementation(
              api: DioConsumer(dio: Dio()),
            ),
          ),
        ),
      ],
      child: const TestAPI(),
    ),
  );
}
