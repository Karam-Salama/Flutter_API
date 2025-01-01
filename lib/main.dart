import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cache/cache_helper.dart';
import 'core/api/dio_consumer.dart';
import 'cubit/user_cubit.dart';
import 'screens/sign_in_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) => UserCubit(apiConsumer: DioConsumer(dio: Dio())),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}




//* ------------------------ when we need to play with api we need to create ---------------------
//! ================================= 4 Essential classes ========================================
//? Essential classes Created Only Once Not Changed As Templates You Can Reuse Them In Any Project
// Essential classes: { (1) ApiConsumer  (2) DioConsumer (3) ApiInterceptor (4) EndPoints & ApiKey }

//! ================================= 2 Helper classes ===========================================
// Helper classes: { (1) ErrorModel (2) ServerException (3) CacheHelper (4) SignInModel }