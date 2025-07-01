import 'package:flutter/material.dart';
import 'package:project_bloc/app/constant/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/app.dart';
import 'core/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: SupabaseCredentials.url,
    anonKey: SupabaseCredentials.anonKey,
  );
  await configureDependencies();
  runApp(const MyApp());
}
