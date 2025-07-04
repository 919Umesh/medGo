part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

// Changed to parameterless since we're getting userId from PrefHelper
class FetchProfileEvent extends ProfileEvent {
  const FetchProfileEvent();

  @override
  List<Object> get props => [];
}
