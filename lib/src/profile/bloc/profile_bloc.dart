import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
    on<UpdateProfileEvent>(_onUpdateProfile);
  }

  Future<void> _onFetchProfile(
      FetchProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final profile = await _profileRepository.fetchProfile(event.profileId);
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> _onUpdateProfile(
      UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final updatedProfile =
          await _profileRepository.updateProfile(event.profile);
      emit(ProfileUpdated(updatedProfile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
