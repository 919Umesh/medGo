import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_bloc/core/core.dart';
import 'package:project_bloc/src/profile/model/profile_model.dart';
import 'package:project_bloc/src/profile/repository/profile_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileBloc()
      : _profileRepository = ProfileRepository(),
        super(ProfileInitial()) {
    on<FetchProfileEvent>(_onFetchProfile);
  }

  Future<void> _onFetchProfile(
      FetchProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final userId = await locator<PrefHelper>().getUserToken();
      Fluttertoast.showToast(msg: 'UserId get: $userId');
      final profile = await _profileRepository.fetchProfile(userId.toString());
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
