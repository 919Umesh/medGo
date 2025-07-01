// // In main.dart after configureDependencies()
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Supabase.initialize(
//     url: SupabaseCredentials.url,
//     anonKey: SupabaseCredentials.anonKey,
//   );
//   await configureDependencies(); // Initialize get_it
  
//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (_) => getIt<SplashBloc>()),
//         BlocProvider(create: (_) => getIt<AuthBloc>()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// // Then simplify MyApp to just:
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return OKToast(
//       child: MaterialApp(
//         navigatorKey: AppInfo.navigatorKey,
//         title: AppInfo.appName,
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(
//             seedColor: kPrimaryColor,
//             primary: kPrimaryColor,
//           ),
//           useMaterial3: true,
//         ),
//         initialRoute: AppRoute.splashScreenPath,
//         onGenerateRoute: RouteGenerator.generateRoute,
//       ),
//     );
//   }
// }