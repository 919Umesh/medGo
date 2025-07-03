import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_bloc/app/constant/api_endpoints.dart';
import 'package:project_bloc/app/temp/custom_log.dart';
import 'package:project_bloc/core/injection/injection_helper.dart';
import 'package:project_bloc/core/services/api/api_constants.dart';
import 'package:project_bloc/core/services/api/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final apiProvider = locator<APIProvider>();

class APIProvider {
  static final APIProvider _instance = APIProvider._internal();
  Dio? _dio;
  CacheOptions? _cacheOptions;
  late SupabaseService _supabaseService;

  factory APIProvider() {
    return _instance;
  }

  APIProvider._internal() {
    _initSupabase();
  }

  void _initSupabase() {
    final client = Supabase.instance.client;
    _supabaseService = SupabaseService(client);
  }

  SupabaseService get supabase => _supabaseService;
}
