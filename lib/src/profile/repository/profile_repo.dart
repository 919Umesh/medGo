import 'package:flutter/material.dart';
import 'package:project_bloc/core/services/supabase/supabase_helper.dart';
import 'package:project_bloc/src/profile/model/profile_model.dart';

class ProfileRepository {
  Future<ProfileModel> fetchProfile(String profileId) async {
    final response = await SupabaseHelper.fetchSingle(
      table: 'profiles',
      column: 'profile_id',
      value: profileId,
    );
    debugPrint('--------------profile------');
    debugPrint(response.toString());
    return ProfileModel.fromJson(response);
  }

  Future<ProfileModel> updateProfile(ProfileModel profile) async {
    final response = await SupabaseHelper.upsert(
      table: 'profiles',
      data: profile.toJson(),
    );
    return ProfileModel.fromJson(response);
  }
}
