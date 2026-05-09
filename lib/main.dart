//  ----------- CODE FOR DEPENDENCY INJECTION -----------  //

// import 'package:flutter/material.dart';
// import 'package:testapp/LayoutBuilderTesting.dart';
// import 'package:testapp/homePage.dart';
// import 'package:testapp/mediaQueryTesting.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: Homepage(),
//     );
//   }
// }


//  ----------- CODE FOR DEPENDENCY INJECTION -----------  //////////

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:testapp/dependency_injection/app_info.dart';
// import 'package:testapp/dependency_injection/locator.dart';

// import 'dependency_injection/home_view.dart';


// void main() {
//   setupLocator();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Provider(
//       create: (context) => AppInfo(),
//       child: MaterialApp(
//         title: 'Dependency Injection',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: Scaffold(
//           body: HomeView(
//             appInfo: Provider.of<AppInfo>(context)
//           ),
//         ),
//       ),
//     );
//   }
// }


// // ----------- CODE FOR STATEFUL AND STATELESS WIDGETS -----------  //////////
// import 'package:flutter/material.dart';
// import 'package:testapp/stateless_and_stateful/home_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }


// ----------- CODE FOR PROVIDER STATE MANAGEMENT -----------  //////////

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:testapp/provider_state_management/provider/count_provider.dart';
// import 'package:testapp/provider_state_management/screens/count_example.dart';
// import 'package:testapp/provider_state_management/why_provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<CountProvider>(
//       create: (context) => CountProvider(),
//       child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CountExample(),
//      ),
//     );
//   }
// }


// // ------------ MULTIPROVIDER EXAMPLE -----------  //////////
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:testapp/provider_state_management/provider/auth_provider.dart';
// import 'package:testapp/provider_state_management/provider/count_provider.dart';
// import 'package:testapp/provider_state_management/provider/example_one_provider.dart';
// import 'package:testapp/provider_state_management/provider/favourite_provider.dart';
// import 'package:testapp/provider_state_management/provider/theme_changer_provider.dart';
// import 'package:testapp/provider_state_management/screens/count_example.dart';
// import 'package:testapp/provider_state_management/screens/dark_theme.dart';
// import 'package:testapp/provider_state_management/screens/favourite/favourite_screen.dart';
// import 'package:testapp/provider_state_management/screens/login.dart';
// import 'package:testapp/provider_state_management/screens/value_notify_listener.dart';
// import 'package:testapp/provider_state_management/why_provider.dart';
// import 'package:testapp/provider_state_management/screens/example_one.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//   //final themeChanger = Provider.of<ThemeChangerProvider>(context);
//     return MultiProvider(
//       providers: [
//        ChangeNotifierProvider(create: (_) => CountProvider()),
//        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
//        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
//        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
//        ChangeNotifierProvider(create: (_) => AuthProvider()),
//       ],
//       child: Builder(builder: (BuildContext context){
//         final themeChanger = Provider.of<ThemeChangerProvider>(context);
//         return MaterialApp(
//          debugShowCheckedModeBanner: false,
//          title: 'Flutter Demo',
//          themeMode:themeChanger.themeMode,
//          theme: ThemeData(
//           brightness: Brightness.light,
//          primarySwatch: Colors.red,
//          appBarTheme: AppBarTheme(
//               backgroundColor: Colors.orange,
//             ),
//           ),
//           darkTheme: ThemeData(
//             brightness: Brightness.dark,
//             primarySwatch: Colors.pink,
//             appBarTheme: AppBarTheme(
//               backgroundColor: Colors.teal,
//             ),
//             iconTheme: IconThemeData(
//               color: Colors.pink,
//             )
//           ),
//          home: LoginScreen(),
//         );
//       })
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:testapp/homePage.dart';
// import 'package:testapp/rest_api_get/example_four.dart';
// import 'package:testapp/rest_api_get/example_three.dart';
// import 'package:testapp/rest_api_get/example_two.dart';
// import 'package:testapp/rest_api_post/signup.dart';
//
// import 'rest_api_get/home_screen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: SignUpScreen(),
//     );
//   }
// }





///// --------------- BLOCK STATE MANAGEMENT ------------ /////


// BLOC STATE MANAGEMENT
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:testapp/bloc_state_management/bloc_explore_counter/bloc/counter/counter_bloc.dart';
// import 'package:testapp/bloc_state_management/image_picker/bloc/image_picker_bloc.dart';
// import 'package:testapp/bloc_state_management/image_picker/utils/image_picker_utils.dart';
// import 'package:testapp/bloc_state_management/switch_example/bloc/switch_bloc.dart';
// import 'bloc_state_management/bloc_explore_counter//ui/counter_screen.dart';
// import 'bloc_state_management/equatable_testing.dart';
// import 'bloc_state_management/favourite_app/bloc/favourite_app_bloc.dart';
// import 'bloc_state_management/favourite_app/repository/favourite_repository.dart';
// import 'bloc_state_management/favourite_app/ui/favourite_app_screen.dart';
// import 'bloc_state_management/freezed_tutorial/code/home_screen.dart';
// import 'bloc_state_management/image_picker/ui/image_picker_screen.dart';
// import 'bloc_state_management/login_signup_bloc/login/ui/login_screen.dart';
// import 'bloc_state_management/posts_app/bloc/posts_bloc.dart';
// import 'bloc_state_management/posts_app/ui/posts_screen.dart';
// import 'bloc_state_management/switch_example/ui/switch_example_screen.dart';
// import 'bloc_state_management/to_do_screen/bloc/to_do_bloc.dart';
// import 'bloc_state_management/to_do_screen/ui/to_do_screen.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         // BlocProvider(
//         //   create: (_) => CounterBloc(),
//         // ),
//         /// SHOULD NOT GLOBALLY USE BLOC AS THAT IS NOT BEST PRACTICE USE LIKE USING COUNTER BLOC FOR COUNTER SCREEN
//         BlocProvider(
//           create: (context) => SwitchBloc(),
//         ),
//         BlocProvider(
//             create: (context) => ImagePickerBloc(ImagePickerUtils()),
//         ),
//         BlocProvider(
//             create: (context) => ToDoBloc(),
//         ),
//         BlocProvider(
//             create: (context) => FavouriteBloc(FavouriteRepository()),
//         ),
//         BlocProvider(
//           create: (context) => PostBloc(),
//         )
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           //brightness: Brightness.dark,
//           // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         //home: CounterScreen(),
//         home: HomeScreen(),
//       ),
//     );
//   }
// }

// BLOC CLEAN CODING _secure_storage_reusable_components_singleton_pattern
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:testapp/bloc_state_management/bloc_clean_movie_app/repository/movies/movies_http_api_repository.dart';
// import 'package:testapp/bloc_state_management/bloc_clean_movie_app/repository/movies/movies_repository.dart';
// import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/config/routes/routes_name.dart';
// import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/repository/auth/login_http_api_repository.dart';
// import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/repository/auth/login_mock_api_repository.dart';
// import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/repository/auth/login_repository.dart';
// import 'package:testapp/bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/view/splash/splash_screen.dart';
// import 'package:testapp/rest_api_covid_app/splash_screen.dart';
// import 'package:testapp/rest_api_get/fill_data_from_api_into_dropdown/drop_down_api.dart';
// import 'package:testapp/rest_api_post/UploadImageScreen.dart';
//
// import 'bloc_state_management/flutter_bloc_clean_coding_secure_storage_reusable_components_singleton_pattern/config/routes/routes.dart';
//
// GetIt getIt = GetIt.instance;
// void main() {
//   serviceLocator();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           brightness: Brightness.dark,
//
//           // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           primarySwatch: Colors.blue,
//           useMaterial3: true,
//         ),
//         //home: Uploadimagescreen(),
//         //home: SplashScreenCovidApp(),
//         home: DropDownApi(),
//         // ---- THESE FOR BLOC STATE MANAGEMENT CLEAN CODE ----------
//         // initialRoute: RoutesName.moviesHomeScreen,
//         // onGenerateRoute: Routes.generateRoute,
//         // ---- THESE FOR BLOC STATE MANAGEMENT CLEAN CODE ---

//       );
//   }
// }
//
//
//
// void serviceLocator(){
//   getIt.registerLazySingleton<LoginRepository>(() => LoginHttpApiRepository());
//   getIt.registerLazySingleton<MoviesRepository>(() => MoviesHttpApiRepository());
// }
//

/////// ISOLATES , FUTURES , ASYNC , AWAIT , STREAM

// import 'package:flutter/material.dart';
// import 'Async_Await_Futures/futureHome.dart';
// import 'isolates/isolate_home_page.dart';
// import 'package:testapp/streams/streampage.dart';
//
// void main() {
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//       //home: IsolateHomePage(),
//       //home: Futurehome(),
//       home: Streampage(),
//       );
//   }
// }



/// GO ROUTER
import 'package:flutter/material.dart';
import 'package:testapp/go_router/project/routes/app_route_config.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: MyAppRouter.returnRouter(true).routeInformationParser,
      routerDelegate: MyAppRouter.returnRouter(true).routerDelegate,
      );
  }
}