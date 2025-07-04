// lib/core/services/supabase_helper.dart
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseHelper {
  static final SupabaseClient _client = Supabase.instance.client;

  static Future<Map<String, dynamic>> fetchSingle({
    required String table,
    String column = 'id',
    required String value,
  }) async {
    try {
      return await _client.from(table).select().eq(column, value).single();
    } catch (e) {
      throw Exception('Failed to fetch from $table: $e');
    }
  }

  static Future<List<dynamic>> fetchAll({
    required String table,
    Map<String, dynamic>? filters,
  }) async {
    try {
      var query = _client.from(table).select();
      filters?.forEach((key, value) => query = query.eq(key, value));
      return await query;
    } catch (e) {
      throw Exception('Failed to fetch from $table: $e');
    }
  }

  static Future<Map<String, dynamic>> upsert({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    try {
      return await _client.from(table).upsert(data).select().single();
    } catch (e) {
      throw Exception('Failed to upsert to $table: $e');
    }
  }

  static Future<Map<String, dynamic>> signInWithPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) throw Exception('No user returned');
      return {
        'userId': response.user!.id,
        'email': response.user!.email,
      };
    } on AuthException catch (e) {
      throw Exception('Auth error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to authenticate: $e');
    }
  }

  static Future<Map<String, dynamic>> signUpWithEmail({
    required String email,
    required String password,
    Map<String, dynamic>? userMetadata,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        data: userMetadata,
      );
      if (response.user == null && response.session == null) {
        return {
          'email': email,
          'requiresConfirmation': true,
        };
      } else if (response.user == null) {
        throw Exception('No user returned');
      }

      return {
        'userId': response.user!.id,
        'email': response.user!.email,
        'requiresConfirmation': false,
      };
    } on AuthException catch (e) {
      throw Exception('Auth error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }
}
