// // Automatic FlutterFlow imports
// import '/backend/schema/structs/index.dart';
// import '/backend/schema/enums/enums.dart';
// import '/backend/supabase/supabase.dart';
// import '/actions/actions.dart' as action_blocks;
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/actions/index.dart'; // Imports other custom actions
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';
// // Begin custom action code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:supabase_flutter/supabase_flutter.dart'; // Added for AuthResponse and AuthException
// import 'package:shared_preferences/shared_preferences.dart';

// Future<String?> signUpWithEmail(
//   String email,
//   String password,
//   String confirmPassword,
// ) async {
//   if (password == confirmPassword) {
//     try {
//       final supabase = SupaFlow.client;
//       final AuthResponse res = await supabase.auth.signUp(
//         email: email,
//         password: password,
//       );
//       // You might want to check if signup was successful
//       if (res.user != null) {
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('user_id', res.user!.id);
//         print('Signup success: user_id = ${res.user!.id}');
//         return null; // Success
//       } else {
//         return "Sign up failed for unknown reason";
//       }
//     } on AuthException catch (e) {
//       return e.message;
//     } catch (e) {
//       // Handle other exceptions
//       return e.toString();
//     }
//   } else {
//     return "Passwords do not match";
//   }
// }
// // Set your action name, define your arguments and return parameter,
// // and then add the boilerplate code using the green button on the right!




// // Automatic FlutterFlow imports
// import '/backend/schema/structs/index.dart';
// import '/backend/schema/enums/enums.dart';
// import '/backend/supabase/supabase.dart';
// import '/actions/actions.dart' as action_blocks;
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/actions/index.dart'; // Imports other custom actions
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';
// // Begin custom action code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:supabase_flutter/supabase_flutter.dart';

// Future<bool> verifyEmailWithToken(
//   String email,
//   String? token,
// ) async {
//   final supabase = Supabase.instance.client;

//   try {
//     final AuthResponse res = await supabase.auth
//         .verifyOTP(type: OtpType.signup, token: token ?? "", email: email);

//     return res.session != null;
//   } on AuthException catch (e) {
//     print(e.message);
//     return false;
//   } catch (error) {
//     print(error);
//     return false;
//   }
// }




// // Automatic FlutterFlow imports
// import '/backend/schema/structs/index.dart';
// import '/backend/schema/enums/enums.dart';
// import '/backend/supabase/supabase.dart';
// import '/actions/actions.dart' as action_blocks;
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/actions/index.dart'; // Imports other custom actions
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';
// // Begin custom action code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:supabase_flutter/supabase_flutter.dart';

// Future<String?> sendRecoveryEmail(
//   String email,
//   String? redirectTo,
// ) async {
//   final supabase = SupaFlow.client;

//   try {
//     await supabase.auth.resetPasswordForEmail(
//       email,
//       redirectTo: redirectTo,
//     );
//     return null;
//   } catch (e) {
//     return e.toString();
//   }
// }




// // Automatic FlutterFlow imports
// import '/backend/schema/structs/index.dart';
// import '/backend/schema/enums/enums.dart';
// import '/backend/supabase/supabase.dart';
// import '/actions/actions.dart' as action_blocks;
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/actions/index.dart'; // Imports other custom actions
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';
// // Begin custom action code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:supabase_flutter/supabase_flutter.dart'; // Added missing import

// Future<String?> updatePassword(
//   String newPassword,
//   String confirmNewPassword,
// ) async {
//   final supabase = SupaFlow.client;

//   if (newPassword != confirmNewPassword) {
//     return "Passwords do not match!";
//   }

//   try {
//     await supabase.auth.updateUser(UserAttributes(password: newPassword));
//     return null;
//   } catch (e) {
//     return e.toString();
//   }
// }