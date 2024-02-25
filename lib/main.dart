import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weatherapp/repo/hive_repo.dart';
import 'bloc/location/location_bloc.dart';
import 'bloc/signUp/singup_cubit.dart';
import 'bloc/weather/weather_bloc.dart';
import 'model/user_model.dart';
import 'repo/auth_repo.dart';
import 'bloc/auth/auth_bloc.dart';
import 'bloc/signIn/sign_in_cubit.dart';
import 'bloc/theme/theme_cubit.dart';
import 'firebase_options.dart';
import 'router/router.dart';
import 'settings/dark-theme.dart';
import 'settings/light_theme.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  // ensuring widget binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // load env
  await dotenv.load(fileName: ".env");
  tz.initializeTimeZones();
  // intialize hive
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  // the code below was for dedubbging purpose
  // await Hive.openBox<UserModel>('userBox');
  // final retrievedUser = Hive.box<UserModel>('userBox').get('user');
  // print("User is: ${retrievedUser!.email}");

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    /*
    intialize all Repo and Blocs as well as cubit
    */
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepo>(
            create: (context) => AuthRepo(firebaseAuth: FirebaseAuth.instance))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
              create: (context) => AuthBloc(
                  authRepo: context.read<AuthRepo>(),
                  hiveRepository: HiveRepository())),
          BlocProvider<SiginCubit>(
              create: (context) =>
                  SiginCubit(authRepo: context.read<AuthRepo>())),
          BlocProvider<SingupCubit>(
              create: (context) =>
                  SingupCubit(authRepo: context.read<AuthRepo>())),
          BlocProvider(create: (context) => LocationBloc()),
          BlocProvider(create: (context) => WeatherBloc())
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state.enabled ? darkTheme : lightTheme,
              onGenerateRoute: appRouter.onGenratedRoutes,
            );
          },
        ),
      ),
    );
  }
}
