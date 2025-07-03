part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class FetchProfileEvent extends ProfileEvent {
  final String profileId;

  const FetchProfileEvent(this.profileId);

  @override
  List<Object> get props => [profileId];
}
