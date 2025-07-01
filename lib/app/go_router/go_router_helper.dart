import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_bloc/app/go_router/go_router_name.dart';
import '../../src/splash/splash.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoute.splashScreenPath,
      builder: (context, state) => const SplashScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text("ERROR")),
    body: Center(child: Text(state.error.toString())),
  ),
);